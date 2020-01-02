# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = current_user.potential_friends(current_user)
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  def edit; end
end
