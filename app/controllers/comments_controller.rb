class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @playlist = Playlist.find(params[:playlist_id])
  end

  def edit
  end

  def create
    @playlist = Playlist.find(params[:playlist_id])
    @comment = @playlist.comments.build
    authorize @comment
    # @comment.update(comment_params)
    # respond_with(@comment.playlist)
    if @comment.update(comment_params)
      redirect_to @comment.playlist, :notice => "Comment was successfully created."
    else
      redirect_to @comment.playlist, :alert => "Comment cannot be blank!"
    end
  end

  def update
    @comment.update(comment_params)
    respond_with(@comment.playlist)
  end

  def destroy
    authorize @comment
    @comment.destroy
    respond_with(Playlist.find(params[:playlist_id]))
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id)
    end
end
