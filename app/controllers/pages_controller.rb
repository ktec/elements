class PagesController < InheritedResources::Base
  actions :all, :except => [ :new, :destroy ]
  layout :set_layout
  private
  def set_layout
    (action_name == "show"  && @page && @page.layout_name) || 'page'
  end
end