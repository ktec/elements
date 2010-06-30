class Picture < ActiveRecord::Base
  attr_accessible :title, :description, :image, :element_attributes
  has_one :element, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :element, :allow_destroy => true
  has_attached_file :image,
    :styles => { :thumb => "200x200", :large => "640x480>" }#,
    #:path => "/:class/:id/:style/:filename"
  validates_presence_of :image
  liquid_methods :title, :description, :image
  acts_as_taggable_on :tags
end
