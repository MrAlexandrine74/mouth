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
  
  before_filter :set_theme
  def set_theme
    eval "self.prepend_view_path '#{RAILS_ROOT}/vendor/themes/#{pref(:theme)}'"
  end
end
