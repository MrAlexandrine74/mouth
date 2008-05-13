# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def page_title
    @page_title.nil? ? pref('site_name') : "#{pref('site_name')} &raquo; #{@page_title}"
  end
end
