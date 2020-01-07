#frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'homepage;' do
  let(:new_user) { FactoryBot.create(:user) }

  def fill_in_login_detials
    visit(root_path)

    within 'form.form-inline' do
      fill_in 'user[email]', with: new_user.email
      fill_in 'user[password]', with: new_user.password
      click_button 'Log In'
    end
  end
end
