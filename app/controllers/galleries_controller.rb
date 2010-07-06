class GalleriesController < ApplicationController
  filter_resource_access
  actions :all, :except => [ :new, :destroy ]
end
