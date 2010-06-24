class DomainsController < InheritedResources::Base
  actions :all, :except => [ :new, :edit, :update, :destroy ]
end
