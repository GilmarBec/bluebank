Rails.application.routes.draw do
  resources :offices
  resources :routes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
end
