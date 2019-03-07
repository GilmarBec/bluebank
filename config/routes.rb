Rails.application.routes.draw do
  get 'client_session/create'

  get 'client_session/update'

  get 'client_session/destroy'

  resources :clients
  devise_for :employees, controllers: { registrations: 'employee/registrations' }

  resources :agencies
  resources :addresses
  resources :offices
  resources :routes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
end
