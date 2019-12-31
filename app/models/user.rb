# frozen_string_literal: true

class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  def name
    [
      %i[first_name last_name]
    ]
  end

  def friends
    friends_array = friendships.map { |friendship| friendship.friend if friendship.comfirmed }
    friends_array = inverse_friendships.map { |friendship| friendship.friend if friendship.comfirmed }
    friends_array.compact
  end

  def comfirm_friend(user)
    friendship = inverse_friendships.find { |friend| friend.user == user }
    friendship.comfirmed
    friendship.save
  end

  def friend?(user)
    friends.include(user)
  end

  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.comfirmed }.compact
  end

  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.comfirmed }.compact
  end
end
