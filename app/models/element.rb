class Element < ActiveRecord::Base
  attr_accessible :name, :parent_id, :position, :type, :components_attributes
  # Behaviours
  has_ancestry :cache_depth => true
  default_scope :order => 'position'
  has_many :components, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :components, :allow_destroy => true
end
