class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :playlist

  validates :user, :playlist, :text, presence: true
end
