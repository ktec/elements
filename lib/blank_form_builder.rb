class BlankFormBuilder < ActionView::Helpers::FormBuilder
  # This FormBuilder is designed to replace
  # the standard actionview formbuilder when you 
  # want the form object without actually rendering
  # the form
  def form_for(record_or_name_or_array, *args, &proc)
    raise ArgumentError, "Missing block" unless block_given?

    options = args.extract_options!

    case record_or_name_or_array
    when String, Symbol
      object_name = record_or_name_or_array
    when Array
      object = record_or_name_or_array.last
      object_name = ActionController::RecordIdentifier.singular_class_name(object)
      apply_form_for_options!(record_or_name_or_array, options)
      args.unshift object
    else
      object = record_or_name_or_array
      object_name = ActionController::RecordIdentifier.singular_class_name(object)
      apply_form_for_options!([object], options)
      args.unshift object
    end

    #concat(form_tag(options.delete(:url) || {}, options.delete(:html) || {}))
    fields_for(object_name, *(args << options), &proc)
    #concat('</form>'.html_safe)
  end
end
