Rails.application.routes.draw do
  resources :links

  root 'home#index'

  get ':slug' => 'links#show'
  get '/all' => 'home#all'
end
