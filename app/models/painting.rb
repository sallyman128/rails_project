class Painting < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :country, presence: true

  has_many :gallery_paintings
  has_many :galleries, through: :gallery_paintings
  has_many :users, through: :galleries

  scope :search, -> (query) { where("title LIKE ?", "%" + query + "%")}

  def gallery_ids= (gallery_ids)
    gallery_ids.each do |gallery_id|
      unless gallery_id.empty?
        gallery = Gallery.find_by(id: gallery_id)
        self.galleries << gallery
      end
    end
  end
end