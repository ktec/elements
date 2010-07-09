class SitemapController < ApplicationController
  def sitemap
    @pages = Element.find_for_sitemap
    headers["Last-Modified" ] = @pages[0].updated_at.httpdate if @pages[0]
    render :layout => false
  end
  def robots
    render :text => "Sitemap: http://#{request.host}/sitemap.xml"
  end

end
