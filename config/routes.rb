Rails.application.routes.draw do
  resources :posts, only: %i[show index]
  namespace :admin do
    resources :posts, except: %i[index show]
  end
  devise_for :users
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
