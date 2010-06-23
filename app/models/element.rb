class Element < ActiveRecord::Base
  attr_accessible :name, :parent_id, :position
  # Behaviours
  has_ancestry :cache_depth => true
  default_scope :order => 'position'
  belongs_to :attachable, :polymorphic => true, :dependent => :destroy
  validates_presence_of :name
  COMPONENTS = %w(Page Domain Picture)
  
  # Alias for <tt>acts_as_taggable_on :tags</tt>:
  acts_as_taggable  

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
