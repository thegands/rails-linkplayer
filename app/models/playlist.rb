class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :links_playlist
  has_many :links, through: :links_playlist
  has_many :comments
  # accepts_nested_attributes_for :links, allow_destroy: true

  validates :user, :title, presence: true
  validates :private, exclusion: { in: [nil] }

  def links_attributes=(links_hashes)
    if self.valid?

      self.links.clear

      links_hashes.each do |i, links_hashes|
        if ActiveRecord::ConnectionAdapters::Column::FALSE_VALUES.include?(links_hashes[:_destroy])
          link = Link.find_or_create_by(url: links_hashes[:url])
          LinksPlaylist.create(link: link, playlist: self)
        end
      end

    end
  end

end
