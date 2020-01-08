# frozen_string_literal: true

class HomesController < ApplicationController
  def index
    @posts = Post.includes(:user, :likes).all.order('created_at DESC')
  end
end
