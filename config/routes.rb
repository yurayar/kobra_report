Rails.application.routes.draw do

  root 'pages#home'

  get '/dashboard' => 'dashboard#index'

  devise_for :officers
  resources :reports
  resources :cars

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
