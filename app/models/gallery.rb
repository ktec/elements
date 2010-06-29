class Gallery < ActiveRecord::Base
  attr_accessible :title, :description, :layout_name, :custom_layout_content, :element_attributes
  has_one :element, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :element, :allow_destroy => true
  validates_presence_of :title
  has_many :pictures, :through => :element, :conditions => { :attachable_type => "Picture" }
  #liquid_methods :title, :description, :keywords
end
