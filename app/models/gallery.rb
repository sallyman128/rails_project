class Gallery < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :gallery_paintings
  has_many :paintings, through: :gallery_paintings
end