# frozen_string_literal: true

class HomesController < ApplicationController
  def index
    @posts = Post.all
  end
end
