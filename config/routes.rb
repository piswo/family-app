Rails.application.routes.draw do

  get 'sessions/new'
  root 'homes#home'
  get '/help', to: 'homes#help'
  get '/contact', to: 'homes#contact'
  resources :users
end
