class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include DateTimeExtensions
  
  helper :all # include all helpers, all the time
 
  protect_from_forgery # :secret => '9f46fd4bbf282c66a9993f4672c71c4e'

  # Make pref available to helpers
  send :helper_method, :pref
  
  # Shortcut for getting preference for ease.
  def pref(name, reload=false)
    Preference.get(name, reload)
  end
end
