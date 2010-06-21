# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def options_for_select(class_or_item, mover = nil)
    class_or_item = class_or_item.roots if class_or_item.is_a?(Class)
    items = Array(class_or_item)
    result = [["",""]]
    items.each do |root|
      result += root.subtree.collect do |i|
        #if mover.nil? || mover.new_record? || mover.move_possible?(i)
          [yield(i), i.id] #unless i == mover
        #end
      end.compact
    end
    result
  end
  def link_to_add_fields(name, f, association, new_object = nil)
    if new_object.nil?
      new_object = f.object.class.reflect_on_association(association).klass.new
    end
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    #link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
end
