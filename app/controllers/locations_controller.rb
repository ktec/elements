class LocationsController < InheritedResources::Base
  actions :all
  before_filter :authenticate_user!, :except => [:index,:show]
  filter_resource_access
end
