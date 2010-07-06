class Paragraph < ActiveRecord::Base
  using_access_control
  attr_accessible :content, :element_attributes
  has_one :element, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :element, :allow_destroy => true
  validates_presence_of :content
end
