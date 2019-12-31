# frozen_string_literal: true

module UsersHelper
  def my_profile(user)
    return true if current_user == user

    return false
  end
end
