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
  def money_formater amount
    number_to_currency(amount, :unit => "IDR", :format => '%u %n', :precision => 0 , :divisions => '.', :delimiter => '.')
  end
end
