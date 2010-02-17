class PaintColor < ActiveRecord::Base
  belongs_to :product
  belongs_to :color_product, :class_name=> "Product", :foreign_key => :color_id
  belongs_to :paint_color_type

end