class User < ApplicationRecord
  validates :username,
            presence: true,
            length: { minimum: 3, maximum: 20 },
            uniqueness: { case_sensitive: false }
  
  validates :password,
            presence: true,
            length: { minimum: 8, maximum: 25 }

  has_secure_password
end