# Add Jquery rails support
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :defaults => [
'jquery.min',
'rails',
'jquery-ui.min',
'jquery.form'
]

# Default stylesheet asset pack set #
ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :theme => [
  'scaffold', 
  'theme', 
  'element-gallery', 
  'themes/base/jquery.ui.all.css'
]


# FancyPants #
ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :fancybox => [
	"/javascripts/fancybox/jquery.fancybox-1.3.1.css"
]
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :fancybox => [
  'fancybox/jquery.mousewheel-3.0.2.pack',
  'fancybox/jquery.fancybox-1.3.1'
]


# jsTree #
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jstree => [
  'jstree/jquery.jstree', 
  'jstree/_lib/jquery.cookie', 
  'jstree/_lib/jquery.hotkeys'
]


# jquery layout
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :layout => [
  'jquery.layout.min'
]

# textile editor
ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :textile_editor => [
	"textile-editor"
]
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :textile_editor => [
  'textile-editor',
  'textile-editor-config',
]