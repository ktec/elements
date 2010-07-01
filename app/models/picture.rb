class Picture < ActiveRecord::Base
  attr_accessible :title, :description, :image, :element_attributes
  has_one :element, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :element, :allow_destroy => true
  has_attached_file :image,
    :styles => { 
        :tiny_thumb => "50x20>", 
        :small_thumb =>"100x100>", 
        :thumb => "200x200", 
        :large => "640x480>" }#,
        #:custom => Proc.new { |instance| "#{instance.image_width}x#{instance.image_height}>" } }
    #:path => "/:class/:id/:style/:filename"
  validates_presence_of :image
  #validates_attachment_size :image, :less_than => 5.megabytes
  #validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png'
  liquid_methods :title, :description, :image
end
