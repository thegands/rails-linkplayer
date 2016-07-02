class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :links_playlist
  has_many :links, through: :links_playlist

  validates_associated :links
  accepts_nested_attributes_for :links, allow_destroy: true

  validates :user, :title, presence: true

end
