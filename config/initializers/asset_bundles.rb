
## STYLESHEET BUNDLES

ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :jquery_ui => [
    'jquery-ui/themes/smoothness/jquery.ui.all.css',
    'jquery-ui/themes/smoothness/jquery.ui.all.css'
  ], 
  :fancybox => [
  	"/javascripts/fancybox/jquery.fancybox-1.3.1.css"
  ], 
  :textile_editor => [
  	"textile-editor"
  ]


## JAVASCRIPT BUNDLES

ActionView::Helpers::AssetTagHelper.register_javascript_expansion :defaults => [
  ],
  :jquery => [
    'jquery.min',
    'jquery-ui.min',
    'jquery.layout.min',
    'jquery.ui.potato.menu-min',
    'jquery.form',
    'rails'
  ],
  :fancybox => [
    'fancybox/jquery.mousewheel-3.0.2.pack',
    'fancybox/jquery.fancybox-1.3.1'
  ],
  :jstree => [
    'jstree/jquery.jstree', 
    'jstree/_lib/jquery.cookie', 
    'jstree/_lib/jquery.hotkeys'
  ],
  :textile_editor => [
    'textile-editor',
    'textile-editor-config',
  ]
