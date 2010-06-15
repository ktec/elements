class Element < ActiveRecord::Base
  attr_accessible :name, :position, :parent_id, :type
  default_scope :order => 'position'
  # Behaviours
  has_ancestry :cache_depth => true, :orphan_strategy => :rootify
  SUBCLASSES = []

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

