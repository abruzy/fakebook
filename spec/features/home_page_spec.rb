# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe 'homepage;' do
#   let(:new_user) { FactoryBot.create(:user) }

#   def fill_in_login_detials
#     within 'form.form-inline' do
#       fill_in 'user[email]', with: new_user.email
#       fill_in 'user[password]', with: new_user.password
#       click_button 'Log In'
#     end
#   end

#   scenario 'authenticated user sees link to home' do
#     visit(root_path)
#     fill_in_login_detials
#     expect(page).to have_link 'Home'
#   end

#   scenario "authenticated user sees self's name button" do
#     visit(root_path)
#     fill_in_login_detials
#     expect(page).to have_content new_user.first_name
#   end

#   scenario 'unauthenticated user sees sign up form' do
#     visit(root_path)
#     expect(page).to have_content 'Sign Up'
#   end

#   scenario 'unauthenticated user sees log in form' do
#     visit(root_path)
#     expect(page).to have_button 'Log In'
#   end
# end
