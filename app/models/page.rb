class Page < ActiveRecord::Base
  using_access_control
  attr_accessible :title, :description, :keywords, :show_share_links, :layout_name, :custom_layout_content, :element_attributes
  has_one :element, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :element, :allow_destroy => true
  validates_presence_of :title
  liquid_methods :title, :description, :keywords
  
  after_save :expire_cache_by_name
  after_save :expire_cache_by_id
  
  def expire_cache_by_name
    #Rails.cache.expire("page:name:#{self.element.name}")
    return true
  end

  def expire_cache_by_id
    #Rails.cache.expire("page:#{self.id}")
    return true
  end
  
end
