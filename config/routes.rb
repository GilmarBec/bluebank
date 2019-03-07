Rails.application.routes.draw do
  get 'movement_api/transaction'
  get 'movement_api/show'

  get 'register_employee/index'
  get 'register_employee/new'
  get 'register_employee/create'
  get 'register_employee/edit'
  get 'register_employee/update'

  resources :accounts

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
