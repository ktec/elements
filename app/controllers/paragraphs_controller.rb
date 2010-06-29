class ParagraphsController < InheritedResources::Base
  actions :all, :except => [ :new, :destroy ]
end