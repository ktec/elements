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
end
