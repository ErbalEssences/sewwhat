class Note < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  belongs_to :pattern

  scope :private_only, -> { where("public = ?", false) }
  scope :public_only, -> { where("public = ?", true) }
end
