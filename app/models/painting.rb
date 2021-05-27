class Painting < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :country, presence: true

  has_many :gallery_paintings
  has_many :galleries, through: :gallery_paintings
  has_many :users, through: :galleries

  def self.all_countries
    ISO3166::Country.all.map {|country| country.name}
  end
end