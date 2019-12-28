# frozen_string_literal: true

class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :truncated_name, use: :slugged
  belongs_to :user

  has_one_attached :image

  validates :description, presence: true, length: { minimum: 5 }

  def truncated_name
    description.split[0..4].join(' ')
  end
end
