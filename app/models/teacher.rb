class Teacher < ApplicationRecord
  has_many :classes
  has_many :students, through: :classes
end