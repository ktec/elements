class Element < ActiveRecord::Base
  using_access_control
  belongs_to :attachable, :polymorphic => true, :dependent => :destroy
  # Behaviours
  has_ancestry :cache_depth => true
  default_scope :order => :position
  # Alias for <tt>acts_as_taggable_on :tags</tt>:
  acts_as_taggable
  acts_as_taggable_on :regions # this allowes us to target specific areas of the page

  accepts_nested_attributes_for :attachable
  
  # Implement build_attachable because it will not be generated automatically
  def build_attachable(attr_params={})
    @attachable_type = attr_params[:attachable_type] || self.attachable_type.to_s
    self.attachable = @attachable_type.constantize.new(attr_params) unless @attachable_type.nil?
  end
  
  attr_accessible :name, :parent_id, :position, :type, 
    :attachable_type, :attachable_id, :attachable, 
    :attachable_attributes, :tag_list
  validates_presence_of :name, :attachable

  named_scope :featured, { :joins => [:taggings,:tags], :conditions => ["tags.name = 'featured'"] }
  named_scope :by_region, proc {|region| { :joins => [:taggings,:tags], :conditions => ["tagging.context = ? and tags.name = ?", :regions, region ] } }
  named_scope :by_tag, proc {|tag| { :joins => [:taggings,:tags], :conditions => ["tags.name = ?", tag ] } }
  named_scope :limit, proc {|limit| { :limit => limit.to_i } }
  named_scope :by_type, proc {|type| { :conditions => { :attachable_type => type } } }
  #named_scope :pictures, lambda { { :joins => :children, :having => { :attachable_type => "Picture" } } }
  default_scope :order => 'ancestry ASC'

  
  liquid_methods :name, :position, :type, :tag_list
  
  COMPONENTS = %w(Page Domain Picture Paragraph Gallery)
  
  def has_attachable?
    return (attachable_type != "" && attachable_id != "")
  end
  
  def add_child(element,position=nil)
    el_children = element.children
    element.position = position || siblings.to_i + 1
    element.parent = self
    element.save!
    element.update_children(el_children) unless el_children.nil?
  end

  protected

    def update_children(children)
      children.each do |child|
        temp = child.children
        child.parent = self
        child.save!
        child.update_children(temp) unless temp.nil?
      end
    end

end
