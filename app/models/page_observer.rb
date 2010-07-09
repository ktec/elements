require 'net/http'
require 'uri'

class PageObserver < ActiveRecord::Observer
  observe Page
  include ActionController::UrlWriter
  default_url_options[:host] = 'www.your-domain.com'
  def after_save(page)
    Net::HTTP.get('www.google.com' ,
      '/ping?sitemap=' + URI.escape(sitemap_url))
  end
end
