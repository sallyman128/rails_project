class Song < ApplicationRecord
  has_many :song_playlists
  has_many :playlists, through: :song_playlists
  has_many :users, through: :playlists
  belongs_to :artist
end