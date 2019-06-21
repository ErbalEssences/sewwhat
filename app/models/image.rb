class Image < ApplicationRecord
  validates :url, presence: true

  belongs_to :user, optional:true
  belongs_to :pattern

  scope :line_art_only, -> { where("line_art = ?", true) }
  scope :user_only, -> { where("user_id >= ?", 0) }
  scope :main_only, -> { where("line_art = false AND user_id IS NULL") }

end
