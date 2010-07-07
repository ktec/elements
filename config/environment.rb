# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # ANCESTRY
  config.gem "ancestry" # for hierarchy of elements
  config.gem "acts-as-taggable-on" # for tagging elements
  
  # ATTACHMENTS
  config.gem "paperclip" # for attachments
  
  # ACTION CONTROLLER
  config.gem "inherited_resources", :version => "1.0.6"
  config.gem "has_scope"
  config.gem "responders", :version => ">=0.4.3"

  # AUTHENTICATION
  config.gem "warden"
  config.gem "devise"

  # SEARCH
  # config.gem "meta_search" # for search
  # acts_as_indexed 
  # :git => http://github.com/technoweenie/can_search.git
  # config.gem "acts_as_solr" # might be this websolr-acts_as_solr

  # AUTHORIZATION
  config.gem "declarative_authorization" # for authorization
  
  # CACHING
  # implement memcache on index/show actions
  #   check out this link for gotchas : http://www.whatcodecraves.com/articles/2010/02/24/page_caching_gotcha_on_heroku/index.html
  
  # VERSIONING
  # config.gem "vestal_versions" # for element/page versioning
  
  # VIEW HELPERS
  # config.gem "will_paginate" # for pagination
  # config.gem "geokit" for location based stuff, geocoding, distance, lat/lng AR lookup and IP based lookup 

  # FORMS
  config.gem "liquid" # for page templates
  config.gem "RedCloth" # for content markup
  config.gem "formtastic" # for clean forms
  # config.gem "jintastic" # for in place editing 
  # validation_reflection # for validation http://github.com/redinger/validation_reflection
  # jquery ui datepicker # http://blog.brzezinka.eu/tag/formtastic
    # http://github.com/vigetlabs/acts_as_markup/ # to support more than just textile
    # get fully marked up with http://markitup.jaysalvat.com/home/
    # textile editor # http://gist.github.com/406968
    # rails plugin for mark_it_up # http://github.com/cingel/mark_it_up
  # http://github.com/hagenburger/lemonade for css spriting

  # BLOG
  # http://github.com/bscofield/bloget # possible solution for blog component
  # http://github.com/norman/disqus.git for blog post comments
  
  
  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de

end