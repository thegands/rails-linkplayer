class VideoController < ApplicationController
  def index
    if params[:url]
      render :show
    end
  end
end
