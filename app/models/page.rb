class Page < ActiveRecord::Base
  attr_accessible :title, :description, :keywords, :element_attributes
  has_one :element, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :element, :allow_destroy => true
  validates_presence_of :title
end
