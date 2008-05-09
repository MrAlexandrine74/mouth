# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
 
class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  
  helper :all # include all helpers, all the time
 
  protect_from_forgery # :secret => '9f46fd4bbf282c66a9993f4672c71c4e'
  
end
