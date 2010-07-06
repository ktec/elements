class DomainsController < InheritedResources::Base
  actions :all, :except => [ :new, :destroy ]
  filter_resource_access
end
