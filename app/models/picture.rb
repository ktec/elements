class Picture < ActiveRecord::Base
  attr_accessible :title, :description, :image
  belongs_to :attachable, :polymorphic => true
end
