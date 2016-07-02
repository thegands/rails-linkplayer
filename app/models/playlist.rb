class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :links_playlist
  has_many :links, through: :links_playlist
  has_many :comments
  # accepts_nested_attributes_for :links, allow_destroy: true

  validates :user, :title, presence: true

  def links_attributes=(links_hashes)
    if self.valid?

      self.links.clear

      links_hashes.each do |i, links_hashes|
        link = Link.find_by(url: links_hashes[:url])
        if links_hashes[:_destroy] == "0" && link
          LinksPlaylist.create(link: link, playlist: self)
        elsif links_hashes[:_destroy] == "0"
          self.links.build(url: links_hashes[:url])
        end
      end

    end
  end

end
