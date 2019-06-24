class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :notes
  has_many :images
  has_many :closets
  has_many :closet_patterns, through: :closets


  enum skill: {beginner: 0, intermediate: 1, experienced: 2}

  def public_notes
    notes.public_only
  end

  def private_notes
    notes.private_only
  end

end
