xml.instruct!
xml.root do
  @elements.each do |element|
    xml.item(
      :id => "node_" + element.id.to_s,
      :parent_id => (element.parent.id if element.parent ),
      :type => "drive",
      :state => "closed") do |item|
      item.content do |content|
        content.name do |name|
          name.cdata!(h element.name)
        end
      end
   end
  end
end

