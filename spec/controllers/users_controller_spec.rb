# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/devise'

RSpec.describe UsersController do
  describe 'authenticated access' do
    login_user

    it 'should have a current_user' do
      expect(subject.current_user).to_not eq(nil)
    end
  end

  describe 'unauthenticated access' do
    it 'should not have a current_user' do
      expect(subject.current_user).to eq(nil)
    end

    it 'should not get index' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'should not get show' do
      get :show, params: { id: :user }
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
