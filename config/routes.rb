ActionController::Routing::Routes.draw do |map|
  map.resources :posts

  # Named routes
  map.signup      '/signup',                        :controller => 'users', :action => 'new'
  map.login       '/login',                         :controller => 'sessions', :action => 'new'
  map.logout      '/logout',                        :controller => 'sessions', :action => 'destroy'
  
  # Resources
  map.resources :users
  map.resource  :session
end
