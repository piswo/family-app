Rails.application.routes.draw do
  root 'homes#home'
  get '/help', to: 'homes#help'
  get '/contact', to: 'homes#contact'
  resources :users
  resources :sessions, only:[:new, :create, :destroy]

end
