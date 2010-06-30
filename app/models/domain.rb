class Domain < ActiveRecord::Base
  attr_accessible :name, :title, :description, :keywords, :element_attributes
  has_one :element, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :element, :allow_destroy => true
  validates_presence_of :name
  acts_as_taggable_on :tags
end
