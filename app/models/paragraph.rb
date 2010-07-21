class Paragraph < ActiveRecord::Base
	include Elements::Element
  using_access_control
  attr_accessible :content
  validates_presence_of :content
end
