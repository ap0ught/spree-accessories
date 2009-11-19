class Accessory < ActiveRecord::Base
  belongs_to :product
  belongs_to :linkable, :polymorphic => true


  
end