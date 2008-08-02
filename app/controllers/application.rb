class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include DateTimeExtensions
  
  helper :all # include all helpers, all the time
 
  protect_from_forgery
  
  # Make pref available to helpers
  send :helper_method, :pref
  
  # Shortcut for getting preference for ease.
  def pref(name, reload=false)
    Preference.get(name.to_s, reload)
  end
  
  def theme_path
    "#{RAILS_ROOT}/vendor/themes/#{pref(:theme)}"
  end
  
  before_filter :set_theme
  def set_theme
    # stylesheets controller, mime/type etc
    eval "self.prepend_view_path '#{theme_path}'"
  end
  
end
