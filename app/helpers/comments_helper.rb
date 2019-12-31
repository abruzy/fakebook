# frozen_string_literal: true

module CommentsHelper
  def comment_owner(user)
    user.first_name + user.last_name
  end
end
