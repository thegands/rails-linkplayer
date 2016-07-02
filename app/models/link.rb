class Link < ActiveRecord::Base
  has_many :links_playlist
  has_many :playlists, through: :links_playlist

  validates_uniqueness_of :url
  validate :valid_url

  def valid_url
    if self.url.present? && !URI.parse(self.url).kind_of?(URI::HTTP)
      errors.add(:url, "must be a valid URL")
    end
  end

end
