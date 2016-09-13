module CommentsHelper
  def format_time(time)
    time.to_s(:short)
  end
end
