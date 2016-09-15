class UsersController < ApplicationController
  def show
    @user = User.find_by(email: params[:email])
    if user_signed_in? && current_user == @user
      @playlists = Playlist.where(user: @user)
      render 'owner_profile'
    else
      @playlists = Playlist.where(private: false, user: @user)
      render 'profile'
    end
  end
end
