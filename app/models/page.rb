class Page < ActiveRecord::Base
  has_one :element, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :element, :allow_destroy => true
end
