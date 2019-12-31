class FriendsController < ApplicationController
  before_action :find_user, only: %i[friends pending_friends]
  def create
    
  end

  def friends
   @friends = @user.friends
  end

  def pending_friends
    @friends = @user.pending_friends

    render 'friends'
  end
  

  private

  def find_user
    @user = User.friendly.find(params[:id])
  end
  
end
