class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: {case_sensitive: false}, presence: true
  validates :name, presence: true

  has_many :galleries
  has_many :paintings, through: :galleries

end