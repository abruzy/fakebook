# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users' do
  let(:returning_user) { FactoryBot.create(:user) }
  let(:factory_post) { FactoryBot.create(:post) }

  def new_user
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      address: Faker::Address.street_address,
      password: Faker::Internet.password
    }
  end

  def signup(new_user)
    within '.new_user' do
      fill_in 'user[first_name]', with: new_user[:first_name]
      fill_in 'user[last_name]', with: new_user[:last_name]
      fill_in 'user[email]', with: new_user[:email]
      fill_in 'user[address]', with: new_user[:address]
      fill_in 'user[password]', with: new_user[:password]
      click_button 'Sign up'
    end
  end

  def login(user)
    within 'form.form-inline' do
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
    end
  end

  def create_post(description, image)
    fill_in 'post[description]', with: description
    fill_in 'post[image]', with: image
    click_button 'Create'
  end
end
