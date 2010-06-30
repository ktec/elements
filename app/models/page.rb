class Page < ActiveRecord::Base
  attr_accessible :title, :description, :keywords, :show_share_links, :layout_name, :custom_layout_content, :element_attributes
  has_one :element, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :element, :allow_destroy => true
  validates_presence_of :title
  liquid_methods :title, :description, :keywords
  acts_as_taggable_on :tags
end
