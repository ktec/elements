class DomainsController < InheritedResources::Base
  actions :all, :except => [ :new, :destroy ]
end
