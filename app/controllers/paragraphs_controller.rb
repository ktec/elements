class ParagraphsController < InheritedResources::Base
  filter_resource_access
  actions :all, :except => [ :new, :destroy ]
end