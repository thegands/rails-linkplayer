class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @playlist = Playlist.find(params[:playlist_id])
  end

  def edit
  end

  def create
    @comment = Playlist.find(params[:playlist_id]).comments.build
    authorize @comment
    @comment.user = current_user
    @comment.update(comment_params)
    respond_with(@comment.playlist)
  end

  def update
    @comnent.update(comnent_params)
    respond_with(@comnent)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:text)
    end
end
