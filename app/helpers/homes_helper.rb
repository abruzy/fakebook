module HomesHelper
  
  def contains_image(post)
    false unless post.image.valid?

    return true
  end
end
