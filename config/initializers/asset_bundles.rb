
## DEFAULTS

# Reset the default to clear out prototype
ActionView::Helpers::AssetTagHelper::reset_javascript_include_default
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :defaults => []

## JQUERY

ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :jquery_ui => [
    'jquery-ui/themes/smoothness/jquery.ui.all.css'
  ]

ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery => [
    'jquery.min',
    'jquery-ui.min',
    'jquery.layout.min',
    'jquery.ui.potato.menu-min',
    'jquery.form',
    'jintastic',
    'rails'
  ]

## FANCYBOX

ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :fancybox => [
  	"/javascripts/fancybox/jquery.fancybox-1.3.1.css"
  ]
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :fancybox => [
    'fancybox/jquery.mousewheel-3.0.2.pack',
    'fancybox/jquery.fancybox-1.3.1'
  ]


## JSTREE

ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jstree => [
    'jstree/jquery.jstree', 
    'jstree/_lib/jquery.cookie', 
    'jstree/_lib/jquery.hotkeys'
  ]
  

## NIVO SLIDER

ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :nivo_slider => [
  	"nivo-slider"
  ]
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :nivo_slider => [
    'jquery.nivo.slider.pack'
  ]


## TEXTILE

ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :textile_editor => [
  	"textile-editor"
  ]
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :textile_editor => [
    'textile-editor',
    'textile-editor-config',
  ]
