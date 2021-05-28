class Gallery < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :gallery_paintings
  has_many :paintings, through: :gallery_paintings

  def paintings_attributes=(painting_attributes)
    painting_attributes.values.each do |painting_attribute|
      painting = Painting.find_or_create_by(painting_attribute)
      self.gallery_paintings.build(painting:painting)
    end
  end
end