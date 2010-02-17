class PaintColor < ActiveRecord::Base
  belongs_to :product
  belongs_to :color_product, :class_name=> "Product", :foreign_key => :color_id
  belongs_to :paint_color_type

  named_scope :paint_type, lambda {|type_id| { :conditions=>["paint_color_type_id=?",type_id]  } }

end