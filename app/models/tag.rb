class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :pattern_tags
  has_many :patterns, through: :pattern_tags

  # scope :quick, -> { where("prep_time < ?" 40) }

end
