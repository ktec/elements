class Element < ActiveRecord::Base
  attr_accessible :name, :parent_id, :position
  # Behaviours
  has_ancestry :cache_depth => true
  default_scope :order => 'position'
  belongs_to :attachable, :polymorphic => true, :dependent => :destroy
  validates_presence_of :name
  COMPONENTS = %w(Page Domain Picture)
end
