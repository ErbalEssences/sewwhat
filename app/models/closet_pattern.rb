class ClosetPattern < ApplicationRecord
  belongs_to :closet
  belongs_to :pattern

  has_many :users, through: :closets

  scope :total, -> { count() }

end
