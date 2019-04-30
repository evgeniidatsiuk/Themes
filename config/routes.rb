Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :userparams

  resources :systems
  resources :themes

  #get '/:system/:name', to: 'systems#category', as: 'category'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
