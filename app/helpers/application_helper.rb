# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def page_title
    @page_title.nil? ? pref('name') : "#{pref('name')} &raquo; #{@page_title}"
  end
  
  def small_page_title
    @page_title || pref('name')
  end
  
  def page(title, options={})
    render :partial => "subnavigation" unless options[:no_subnav] or not @admin
    @page_title = title
  end
  
end
