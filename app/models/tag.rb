class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :pattern_tags
  has_many :patterns, through: :pattern_tags

  enum category: {Brand: 0, Main: 1, Subcategory: 2, Designer: 3, Collections: 4, Details: 5, Difficulty: 6}

end
