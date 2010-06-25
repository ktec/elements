class PicturesController < InheritedResources::Base
  actions :all, :except => [ :new, :destroy ]
end