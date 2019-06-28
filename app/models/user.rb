class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar

  validates :email, presence: true, uniqueness: true

  has_many :notes
  has_many :images
  has_many :closets
  has_many :closet_patterns, through: :closets


  enum skill: {Beginner: 0, Intermediate: 1, Experienced: 2}

  def public_notes
    notes.public_only
  end

  def private_notes
    notes.private_only
  end

  def closet_number
    closets.total
  end

  def pattern_number
    closet_patterns.total
  end

end
