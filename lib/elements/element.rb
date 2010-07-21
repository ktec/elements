module Elements
  module Element
    
    def self.included(base)
      base.send :extend, ClassMethods
      base.class_eval do
        send :include, InstanceMethods
        has_one :element, :as => :attachable, :dependent => :destroy
        accepts_nested_attributes_for :element, :allow_destroy => true
        attr_accessible :element_attributes
      end
    end
  
    module ClassMethods
      # any method placed here will apply to classes, like Hickwall
      #def acts_as_element(options = {})
      #  send :include, InstanceMethods
      #end
    end
  
    module InstanceMethods
      # any method placed here will apply to instaces, like @hickwall
    end
  end
end
  
#if defined?(ActiveRecord::Base)
#  ActiveRecord::Base.send :include, Element
#end