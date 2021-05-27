class Teacher < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :subjects
  has_many :students, through: :subjects
end