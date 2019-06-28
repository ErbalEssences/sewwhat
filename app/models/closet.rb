class Closet < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :closet_patterns
  has_many :patterns, through: :closet_patterns

  scope :total, -> { count() }

end
