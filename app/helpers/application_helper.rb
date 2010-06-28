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
  def navigation_for(domain = request.domain)
    @domain = Domain.find_by_name(domain)
    unless @domain.blank?
      content_for :navigation do
        convert_to_list(@domain.element)
      end
    end
  end
  def convert_to_list(element)
    result = "<ul>"
    element.children.each do |element|
      if element.attachable.is_a?(Page)
        if defined?(@page)
          current = @page.element
          highlight = true if current.ancestors.include?(element) or current == element unless current.nil? or current.id.nil?
          #highlight = true if current == element unless current.nil? or current.id.nil?
          result << "<li " + (highlight ? "class=\"highlighted\">" : ">")
        else
          result << "<li>"
        end
        result << link_to( h(element.name), send("#{element.attachable.type.to_s.downcase}_path", element.attachable))
        result << convert_to_list(element) if element.has_children?
        result << "</li>"
      end
    end
    result << "</ul>"
    result
  end
  def page_title(title)
    @domain ||= Domain.find_by_name(request.domain)
    content_for(:title) do
      @domain.name + (" | " + title unless title.blank?)
    end
  end
  def liquidize(content, arguments)
    RedCloth.new(Liquid::Template.parse(content).render(arguments, :filters => [LiquidFilters])).to_html
  end
end
