class Domain < ActiveRecord::Base
	include Elements::Element
  attr_accessible :name, :title, :description, :keywords
  validates_presence_of :name
  acts_as_taggable_on :tags
  using_access_control  
end
