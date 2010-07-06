class Gallery < ActiveRecord::Base
  using_access_control
  attr_accessible :title, :description, :layout_name, :custom_layout_content, :element_attributes
  has_one :element, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :element, :allow_destroy => true
  validates_presence_of :title
  #has_many :pictures, :joins => :elements, :conditions => { :attachable_type => "Picture" }
  #liquid_methods :title, :description, :keywords
  def pictures
    element.children.by_type('Picture').map{|element|element.attachable}#.each { |e| n ||<< e.attachable }
  end
end
