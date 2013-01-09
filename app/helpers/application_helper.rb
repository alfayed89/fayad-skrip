module ApplicationHelper
  def fields_with_errors(object, method, &block)
    if block_given?
      if object.errors[method].empty?
        concat capture(&block)
      else
        concat content_tag(:div, ('<div class="fields">'+capture(&block)+"</div><span class='input-error-desc'>#{object.errors[method].join('. ')}</span>").html_safe, class: "fields_with_errors")
      end
    end
  end
end
