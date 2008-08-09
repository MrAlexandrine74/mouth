class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include DateTimeExtensions
  
  helper :all # include all helpers, all the time
 
  protect_from_forgery
  
  # Todo: Clean the following out of the ApplicationController
  
  # Make pref available to helpers
  send :helper_method, :pref
  
  ## Preferences
  
  # Shortcut for getting preference for ease.
  def pref(name, reload=false)
    Preference.get(name.to_s, reload)
  end
  
  ## Themes
  
  def theme_path
    "#{RAILS_ROOT}/vendor/themes/#{pref(:theme)}"
  end
  
  before_filter :set_theme
  def set_theme
    # TODO: Remove the evals and do it more cleanly.
    # stylesheets controller, mime/type etc
    eval "self.prepend_view_path '#{theme_path}'"
  end
  
end
