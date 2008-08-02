# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def page_title
    @page_title.nil? ? pref('name') : "#{pref('name')} &raquo; #{@page_title}"
  end
  
  def small_page_title
    @page_title || pref('name')
  end
  
  
end
