ActionController::Routing::Routes.draw do |map|
  # Named routes
  map.signup      '/signup',                        :controller => 'users', :action => 'new'
  map.login       '/login',                         :controller => 'sessions', :action => 'new'
  map.logout      '/logout',                        :controller => 'sessions', :action => 'destroy'
  
  # Resources
  map.resources   :posts  
  map.resources   :users
  map.resource    :session
  map.root        :posts
  
  # Admin area
  map.namespace :admin do |admin|
    admin.resources :posts
  end
end
