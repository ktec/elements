module ActionView::Helpers::AssetTagHelper
  remove_const :JAVASCRIPT_DEFAULT_SOURCES
  ##JAVASCRIPT_DEFAULT_SOURCES = %w(jquery.min.js rails.js)
  JAVASCRIPT_DEFAULT_SOURCES = %w(rails.js)
  reset_javascript_include_default
end

