class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @playlists = Playlist.all
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
    @playlist = Playlist.new(title: params[:playlist][:title], user: current_user)
    authorize @playlist
    @playlist.assign_attributes(new_playlist_params)
    # @playlist = Playlist.new(playlist_params)
    # @playlist.user = current_user
    @playlist.save
    respond_with(@playlist)
  end

  def update
    @playlist.update(playlist_params)
    respond_with(@playlist)
  end

  def destroy
    authorize @playlist
    @playlist.destroy
    respond_with(@playlist)
  end

  private
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    def playlist_params
      params.require(:playlist).permit(:title, :description, links_attributes: [:url, :id, :_destroy])
    end

    def new_playlist_params
      params.require(:playlist).permit(:description, links_attributes: [:url, :id, :_destroy])
    end
end
