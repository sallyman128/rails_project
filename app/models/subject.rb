class Subject < ApplicationRecord
  validates :name, presence: true
  validate :room_number, presence: true

  belongs_to :student
  belongs_to :teacher
end