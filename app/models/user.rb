# frozen_string_literal: true

class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: [:facebook]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  def name
    [
      %i[first_name last_name]
    ]
  end

  scope :all_except, ->(user) { where.not(id: user) }

  def friends
    friends_array = []
    friendships.each { |friendship| friends_array << friendship.friend if friendship.comfirmed }
    inverse_friendships.each { |friendship| friends_array << friendship.user if friendship.comfirmed }
    friends_array.compact
  end

  def comfirm_friend(user)
    friendship = inverse_friendships.find { |friend| friend.user == user }
    friendship.comfirmed = true
    friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end

  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.comfirmed }.compact
  end

  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.comfirmed }.compact
  end

  def pending_friend?(user)
    pending_friends.include?(user)
  end

  def potential_friends(current_user)
    User.all.map { |user| user unless friend?(user) || current_user == user }.compact
  end

  def self.from_omniauth(auth)
    password = Devise.friendly_token[0, 20]
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = password
      user.password_confirmation = password
      user.first_name = '. '
      user.last_name = auth.info.name
    end
  end
end
