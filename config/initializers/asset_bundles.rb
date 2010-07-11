
## DEFAULTS

# Reset the default to clear out prototype
ActionView::Helpers::AssetTagHelper::reset_javascript_include_default
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :defaults => []

## JQUERY 

ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery => [
    (Rails.env.production? ? 'http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js' : 'jquery.min'),
    'rails',
    'jquery.cookie', 
    'jquery.hotkeys'
  ]

## jquery_ui
ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :jquery_ui => [
    'jquery-ui/themes/smoothness/jquery.ui.all.css'
  ]

ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery_ui => [
    (Rails.env.production? ? 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.2/jquery-ui.min.js' : 'jquery-ui.min')
  ]  

## jquery_layout

ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery_layout => [
    'jquery.layout.min' 
  ]

  
## jquery_menu
ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :jquery_potato_menu => [
    'jquery.ui.potato.menu'
  ]
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery_potato_menu => [
    'jquery.ui.potato.menu-min'
  ]

  
## jquery_form

ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery_form => [
    'jquery.form'
  ]

## formtastic

ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :formtastic => [
  	"formtastic",
    "formtastic_changes"
]

  
## jintastic

ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jintastic => [
    'jintastic'
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
  ]
  
## MARKITUP
ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :markitup_editor => [
    #"/#{MarkItUp.root}/skins/#{MarkItUp.skin}/style.css"
    "/#{MarkItUp.root}/sets/textile/style.css",
  ]
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :markitup_editor => [
    (Rails.env.production? ? "/#{MarkItUp.root}/jquery.markitup.pack.js" : "/#{MarkItUp.root}/jquery.markitup.js"),
    #"/#{MarkItUp.root}/sets/markdown/set.js",
    "/#{MarkItUp.root}/sets/textile/set.js",
  ]
