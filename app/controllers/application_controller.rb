ActionView::Base.default_form_builder = RockFormBuilder
ActionView::Base.field_error_proc = Proc.new do |html_tag, object|
  html = Nokogiri::HTML::DocumentFragment.parse(html_tag)
  html = html.at_css("input") || html.at_css("textarea")
  unless html.nil?
    css_class = html['class'] || "" 
    html['class'] = css_class.split.push("error").join(' ')
    html['data-error'] = object.error_message.join(". ")
    html_tag = (html.to_s+"<span class='input-error-desc'>#{object.error_message.join(". ")}</span>").html_safe
  end
  html_tag
end
class ApplicationController < ActionController::Base
  include ApplicationHelper
  def current_user
    current_karyawan
  end
end
