class SparePart < ActiveRecord::Base
  belongs_to :product
  belongs_to :sp, :polymorphic => true

end