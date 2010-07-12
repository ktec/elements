class Product < ActiveRecord::Base
  PAYMENT_METHODS = ["Cash", "Check", "Visa", "MasterCard", "AmericanExpress", "Discover", "WireTransfer"]
  PRICE_TYPES = ["negotiable", "starting"]
  belongs_to :shop
  has_one :location, :as => :locationable, :dependent => :destroy
  accepts_nested_attributes_for :location, :allow_destroy => true
end
