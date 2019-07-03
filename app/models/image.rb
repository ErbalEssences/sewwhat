class Image < ApplicationRecord
  has_one_attached :file

  validates :url, presence: true, uniqueness: true

  belongs_to :user, optional:true
  belongs_to :pattern

  scope :line_art_only, -> { where("line_art = ?", true) }
  scope :user_only, -> { where("user_id >= ?", 0) }
  scope :main_only, -> { where("line_art = false AND user_id IS NULL") }
  scope :first_only, -> { where("line_art = false AND user_id IS NULL").first }

end
