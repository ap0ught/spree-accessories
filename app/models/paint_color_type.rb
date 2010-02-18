class PaintColorType < ActiveRecord::Base
  has_many :paint_colors

  default_scope :order => "title DESC"

end