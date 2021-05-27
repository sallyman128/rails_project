class User < ApplicationRecord
  has_secure_password

  has_many :galleries
  has_many :paintings, through: :galleries
end