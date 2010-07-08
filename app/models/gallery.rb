class Gallery < ActiveRecord::Base
  using_access_control
  attr_accessible :title, :description, :layout_name, :custom_layout_content, :element_attributes
  has_one :element, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :element, :allow_destroy => true
  validates_presence_of :title
  #has_many :pictures, :joins => :elements, :conditions => { :attachable_type => "Picture" }
  #liquid_methods :title, :description, :keywords
  #has_many :child_elements, :through => :element, :conditions => { :attachable_type => "Picture" } 
  #has_many :pictures, :through => :child_elements

  LAYOUT_TYPES = [
    ["Default", :default.to_s],
    ["FancyBox", :fancybox.to_s],
    ["Slideshow", :slideshow.to_s],
    ["Custom", :custom.to_s]
  ]
  
  def pictures
    element.children.by_type('Picture').map{|element|element.attachable} unless element.nil? or element.children.empty?
  end
  
  # TODO: Get pictures as a has_many join so we can do nested forms
end
