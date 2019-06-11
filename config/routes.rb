Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope "(:locale)", locale: /en|uk/ do
  root 'pages#index'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :userparams
  resources :systems
  resources :themes
  resources :categories
  resources :comments
  resources :conversations do
  resources :messages
  end

  get 'theme/theme_like/:id', 	     to: 'themes#theme_like',        as: 'theme_like'
  get 'theme/theme_dislike/:id',     to: 'themes#theme_dislike',     as: 'theme_dislike'
  get 'comment/comment_like/:id', 	 to: 'comments#comment_like',    as: 'comment_like'
  get 'comment/comment_dislike/:id', to: 'comments#comment_dislike', as: 'comment_dislike'
  get 'theme/chosen/:id',            to: 'themes#chosen',            as: 'chosen'
 end
end
