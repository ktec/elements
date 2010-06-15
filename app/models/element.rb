class Element < ActiveRecord::Base
  attr_accessible :name, :position, :parent_id, :type
  default_scope :order => 'position'
  # Behaviours
  has_ancestry :cache_depth => true, :orphan_strategy => :rootify
  SUBCLASSES = []
end