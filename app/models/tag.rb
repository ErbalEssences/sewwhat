class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :pattern_tags
  has_many :patterns, through: :pattern_tags
end
