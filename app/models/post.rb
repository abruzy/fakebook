# frozen_string_literal: true

class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
  has_many :comments

  def name
    data = ''
    description.each_char { |i| data.size <= 10 ? data << i : break }
    data
  end

  # def update_slug
  #   friendly_id
  # end
end
