Rails.application.routes.draw do
  namespace :load do
    get 'windows_ten_themes/index'
    get 'windows_ten_themes/show'
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :load do
    resources :windows_seven_themes, :windows_eight_themes
  end
  root 'pages#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :userparams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
