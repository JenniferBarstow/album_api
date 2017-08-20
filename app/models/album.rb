class Album < ActiveRecord::Base
  belongs_to :artist

  validates :name, presence: true
  validates :genre, presence: true
  validates :year, presence: true
  validates :artist_id, presence: true

end
