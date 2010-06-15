class JrailsGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.file 'config/jrails.yml', 'config/jrails.yml'

      prefix = "public/javascripts/"
      ['','min.'].each do |i|
        m.file "#{prefix}/jquery.#{i}js"    , "#{prefix}/jquery.#{i}js"
        m.file "#{prefix}/jquery-ui.#{i}js" , "#{prefix}/jquery-ui.#{i}js"
        m.file "#{prefix}/jquery-ui-i18n.#{i}js" , "#{prefix}/jquery-ui-i18n.#{i}js"
        m.file "#{prefix}/jrails.#{i}js"    , "#{prefix}/jrails.#{i}js"
      end
    end
  end
end
