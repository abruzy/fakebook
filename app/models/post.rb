class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user

  def name
    data = ''
    self.description.each_char { |i|  data.size <= 10 ? data << i : break }
    data
  end

  # def update_slug
  #   friendly_id
  # end
end
