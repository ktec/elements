class Element < ActiveRecord::Base
  attr_accessible :name, :parent_id, :position
  # Behaviours
  has_ancestry :cache_depth => true
  default_scope :order => 'position'
  belongs_to :attachable, :polymorphic => true
  validates_presence_of :name
  COMPONENTS = %w(Picture Paragraph Page Gallery)
end
