class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if user_signed_in?
      @playlists = Playlist.find_by_sql("#{Playlist.where(private: false).to_sql} UNION #{Playlist.where(private: true, user: current_user).to_sql}")
    else
      @playlists = Playlist.where(private: false)
    end
    respond_with(@playlists)
  end

  def show
    respond_with(@playlist)
  end

  def new
    @playlist = Playlist.new
    authorize @playlist
    @playlist.links.build
    respond_with(@playlist)
  end

  def edit
    authorize @playlist
  end

  def create
    @playlist = Playlist.new(playlist_params)
    authorize @playlist
    @playlist.save
    respond_with(@playlist)
  end

  def update
    authorize @playlist
    @playlist.update(playlist_params)
    respond_with(@playlist)
  end

  def destroy
    authorize @playlist
    @playlist.destroy
    respond_with(@playlist)
  end

  def popular
    @link = Link.most_popular
    @playlists = @link.playlists.where(private: false)
  end

  private
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    def playlist_params
      params.require(:playlist).permit(
        :title,
        :description,
        :private,
        links_attributes: [:url, :id, :_destroy]
      ).merge(user_id: current_user.id)
    end
end
