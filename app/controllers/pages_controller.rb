class PagesController < InheritedResources::Base
  actions :all, :except => [ :new, :destroy ]
end