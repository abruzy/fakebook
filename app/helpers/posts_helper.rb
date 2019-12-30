# frozen_string_literal: true

module PostsHelper
  def owner(post)
    return true if current_user.id == post.user.id

    false
  end
end
