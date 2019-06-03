class User < ApplicationRecord

  VALID_EMAIL_REJEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 100 }, uniqueness: true,
            format: { with: VALID_EMAIL_REJEX }
  validates :password, presence: true, length: { minimum: 6 }
end
