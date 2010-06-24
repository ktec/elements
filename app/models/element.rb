class Element < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true, :dependent => :destroy
  # Behaviours
  has_ancestry :cache_depth => true
  default_scope :order => :position
  # Alias for <tt>acts_as_taggable_on :tags</tt>:
  acts_as_taggable

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

  COMPONENTS = %w(Page Domain Picture)

  def has_attachable?
    return (attachable_type != "" && attachable_id != "")
  end
  
  def add_child(element,position=nil)
    #need to add errors to @element.errors and return something
    temp = element.children
    element.ancestry = self.child_ancestry
    element.position = position || siblings.to_i + 1
    element.save
    return element.update_children(temp)
  end

  protected

  def update_children(children)
    children.each do |child|
      temp = child.children
      child.ancestry = self.child_ancestry
      child.save!
      return child.update_children(temp)
    end
  end

end
