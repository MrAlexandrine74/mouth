module AdminHelper
  def admin_page_title
    @page_title.nil? ? "#{pref('site_name')} &raquo; Admin" : "#{pref('site_name')} &raquo; Admin &raquo; #{@page_title}"
  end
end
