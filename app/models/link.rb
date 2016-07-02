class Link < ActiveRecord::Base
  has_many :links_playlist
  has_many :playlists, through: :links_playlist

  validate :valid_url

  def valid_url
    if self.url.present? && !URI.parse(self.url).kind_of?(URI::HTTP)
      errors.add(:url, "must be a valid URL")
    end
  end

  def self.process_links(links_attributes)
    links_attributes.values.collect do |link_attr|
      unless empty_url_or_destroy?(link_attr)
        Link.find_or_create_by(url: link_attr[:url])
      end
    end.compact
  end

  private

    def self.empty_url_or_destroy?(link_attr)
      empty_url?(link_attr) || destroy?(link_attr)
    end

    def self.empty_url?(link_attr)
      if (link_attr[:url]).nil?
        binding.pry
      end
      link_attr[:url].length < 1
    end

    def self.destroy?(link_attr)
      link_attr[:_destroy] == "true"
    end

end
