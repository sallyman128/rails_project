class Teacher < ApplicationRecord
  has_secure_password

  has_many :classes
  has_many :students, through: :classes
end