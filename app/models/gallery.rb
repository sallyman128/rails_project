class Gallery < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :gallery_paintings
  has_many :paintings, through: :gallery_paintings

  def paintings_ids= (painting_ids)
    painting_ids.each do |painting_id|
      unless painting_id.empty?
        painting = Painting.find_by(id: painting_id)
        self.paintings << painting
      end
    end
  end

end