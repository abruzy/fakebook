class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  before_save { self.email = email.downcase }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable
  validates :first_name, presence: true
  validates :last_name, presence: true


  def name
    [
      [:first_name, :last_name]
    ]
  end
end
