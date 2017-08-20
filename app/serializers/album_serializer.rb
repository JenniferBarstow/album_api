class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :name, :genre, :year

  belongs_to :artist
end