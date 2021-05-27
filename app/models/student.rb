class Student < ApplicationRecord
  has_many :classes
  has_many :teachers, through: :classes
end