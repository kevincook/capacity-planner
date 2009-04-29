ActionController::Routing::Routes.draw do |map|
  map.resources :resource_allocations

  map.resources :projects
  map.resources :resources

  map.root :controller => 'welcome'

  map.logout    '/logout',    :controller => 'sessions',  :action => 'destroy'
  map.login     '/login',     :controller => 'sessions',  :action => 'new'
  map.register  '/register',  :controller => 'users',     :action => 'create'
  map.signup    '/signup',    :controller => 'users',     :action => 'new'
  map.resources :users

  map.resource :session

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
