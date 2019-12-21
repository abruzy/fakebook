# frozen_string_literal: true

class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    user = User.friendlyid.find(param[:id])
  end

  def edit
  end
end
