class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :notes
  has_many :images
  has_many :closets

  enum skill: {beginer: 0, intermediate: 1, experienced: 2}

end
