Rails.application.routes.draw do
  get 'movement_api/transaction'
  get 'movement_api/check_amount'
  get 'movement_api/extract'
  get 'movement_api/create_session'
  get 'movement_api/destroy_session'

  get 'register_employee/index'
  get 'register_employee/new'
  get 'register_employee/create'
  get 'register_employee/edit'
  get 'register_employee/update'

  resources :accounts

  devise_for :employees, controllers: { registrations: 'employee/registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
end
