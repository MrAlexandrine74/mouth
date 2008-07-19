module AdminHelper
  def admin_page_title
    @page_title.nil? ? "#{pref('name')} &raquo; Admin" : "#{pref('name')} &raquo; Admin &raquo; #{@page_title}"
  end
end
