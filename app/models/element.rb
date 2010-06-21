class Element < ActiveRecord::Base
  attr_accessible :name, :parent_id, :position, :type, :component_attributes
  # Behaviours
  has_ancestry :cache_depth => true
  default_scope :order => 'position'
  has_one :component, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :component, :allow_destroy => true
  COMPONENTS = %w(Picture)
end
