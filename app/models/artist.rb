class Artist < ApplicationRecord
  has_many :songs
  has_many :playlists, through: :songs
  has_many :users, through: :playlists
end