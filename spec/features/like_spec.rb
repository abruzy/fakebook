require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  let(:new_user) { FactoryBot.build(:user) }
  let(:post) { FactoryBot.build(:post) }

  def fill_in_login_detials
    within '#login' do
      fill_in 'user[email]', with: new_user.email
      fill_in 'user[password]', with: new_user.password
      click_button 'Log in'
    end
  end

  scenario 'authenticated user can like a post' do
    visit(root_path)
    fill_in_login_detials
    # expect(page).to have_content 'Signed in successfully.'
    find(:css, '.fa-thumbs-up').click()
    expect(post.likes.count).to eql(1)
    expect(page).to have_content('you liked a post')
  end
end
