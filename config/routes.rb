ActionController::Routing::Routes.draw do |map|
  # Named routes
  map.activate    '/activate/:activation_code',     :controller => 'users', :action => 'activate', :activation_code => nil
  map.signup      '/signup',                        :controller => 'users', :action => 'new'
  map.login       '/login',                         :controller => 'sessions', :action => 'new'
  map.logout      '/logout',                        :controller => 'sessions', :action => 'destroy'
  
  # Resources
  map.resources :users
  map.resource :session
end
