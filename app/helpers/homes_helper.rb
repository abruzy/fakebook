# frozen_string_literal: true

module HomesHelper
  def contains_image(post)
    false unless post.image.valid?

    true
  end
end
