class LinksPlaylist < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :link
end
