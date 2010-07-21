class Shop < ActiveRecord::Base
	include Elements::Element
  using_access_control
  attr_accessible :title, :description, :keywords, :show_share_links, :layout_name, :custom_layout_content, :products_attributes
  validates_presence_of :title
  liquid_methods :title, :description, :keywords
  
  after_save :expire_cache_by_name
  after_save :expire_cache_by_id

  LAYOUT_TYPES = [
    ["Default", :application.to_s],
    ["Plain", :plain.to_s],
    ["Custom", :custom.to_s]
  ]
    
  def expire_cache_by_name
    #Rails.cache.expire("page:name:#{self.element.name}")
    return true
  end

  def expire_cache_by_id
    #Rails.cache.expire("page:#{self.id}")
    return true
  end
  
  has_many :products
  accepts_nested_attributes_for :products, :allow_destroy => true
end