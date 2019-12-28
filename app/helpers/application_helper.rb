# frozen_string_literal: true

module ApplicationHelper
  def gravatar_for(user, size = 30)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravater_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravater_url, alt: user.first_name, class: 'rounded-circle')
  end

  def name(user = nil)
    if user
      user.first_name + ' ' + user.last_name
    else
      current_user.first_name + ' ' + current_user.last_name
    end
  end

  def post_owner(post)
    post.user.first_name + ' ' + post.user.last_name
  end

  def profile_route
    current_page?(user_path(:id))
  end

end
