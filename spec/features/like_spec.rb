# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Likes', type: :feature do
  let(:new_user) { FactoryBot.build(:user) }
  let(:post) { FactoryBot.build(:post) }

  def fill_in_login_detials
    within '#login' do
      fill_in 'user[email]', with: new_user.email
      fill_in 'user[password]', with: new_user.password
      click_button 'Log in'
    end
  end

  scenario 'Default post should have no likes' do
    visit(root_path)
    fill_in_login_detials
    expect(post.likes.count).to eql(0)
  end
end
