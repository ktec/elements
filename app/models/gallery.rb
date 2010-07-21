class Gallery < ActiveRecord::Base
	include Elements::Element
  using_access_control
  attr_accessible :title, :description, :layout_name, :custom_layout_content
  validates_presence_of :title
  #has_many :has_children, :through => :element, :conditions => { :attachable_id => id,:attachable_type => "Gallery" }
  #named_scope :with_pictures, proc {|type| { :conditions => { :attachable_type => type } } }
  #liquid_methods :title, :description, :keywords
  
  #has_many :children, :through => :element
  #has_many :pictures, :through => :child_elements

  LAYOUT_TYPES = [
    ["Default", :default.to_s],
    ["FancyBox", :fancybox.to_s],
    ["Slideshow", :slideshow.to_s],
    ["Custom", :custom.to_s]
  ]
  
  def pictures
    #element.children.by_type('Picture').map{|element|element.attachable} unless element.nil? or element.children.empty?
    #SELECT * FROM "elements" WHERE ("elements".attachable_id = 4 AND "elements".attachable_type = 'Gallery') ORDER BY ancestry ASC LIMIT 1
    Element.descendants_of(element).by_type("Picture").map{|element|element.attachable} unless element.nil?
    # SELECT * FROM "elements" WHERE ("elements".attachable_id = 4 AND "elements".attachable_type = 'Gallery') ORDER BY ancestry ASC LIMIT 1
    # Gets children
    # SELECT * FROM "elements" WHERE ("elements"."ancestry" = '118') ORDER BY ancestry ASC
    # Gets pictures
    # SELECT * FROM pictures INNER JOIN elements ON elements.attachable_id = pictures.id and elements.attachable_type = 'Picture' and elements.ancestry = '118'
  end
  
  # TODO: Get pictures as a has_many join so we can do nested forms
end
