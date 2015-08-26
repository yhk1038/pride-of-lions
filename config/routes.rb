Rails.application.routes.draw do
  
  #resource :users
  #resource :admin_homes
  #resource :boards
  #resource :admin
  resource :menus
  resource :navbars
  root "main#index"
  
  #get 'admin/index'
  #post 'admin/index'
  
  match ':controller(/:action(/:id))', :via => [:post, :get]

end
