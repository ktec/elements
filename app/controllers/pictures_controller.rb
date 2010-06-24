class PicturesController < InheritedResources::Base
  actions :all, :except => [ :new, :edit, :update, :destroy ]
end