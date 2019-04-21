Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :windows_seven_themes,
  :windows_eight_themes,
  :windows_ten_themes,
  :systems
  root 'pages#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :userparams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
