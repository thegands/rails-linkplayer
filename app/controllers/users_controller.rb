class UsersController < ApplicationController
  def show
    # @user = User.find_by(email: params[:email])
    @user = User.find(params[:id])
    if user_signed_in? && current_user == @user
      @playlists = @user.playlists
      render 'show_owner'
    else
      @playlists = @user.playlists.where(private: false)
    end
  end
end
