class OptionalSparePart < ActiveRecord::Base
  belongs_to :product
  belongs_to :osp, :polymorphic => true
end