class Pattern < ApplicationRecord
  validates :name, presence: true, uniqueness: true


  has_many :images

  has_many :closet_patterns
  has_many :closets, through: :closet_patterns

  has_many :pattern_tags
  has_many :tags, through: :pattern_tags

  has_many :notes
  

  def images_line_art_only
    images.line_art_only
  end

  def images_user_only
    images.user_only
  end
  
  def images_main_only
    images.main_only
  end
end
