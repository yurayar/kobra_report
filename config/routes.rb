Rails.application.routes.draw do

  root 'pages#home'

  get '/dashboard' => 'dashboard#index'

  devise_for :officers
  devise_scope :officer do
    get  'officer/new' => 'officer#new'
    post 'officer/new' => 'officer#create'
  end
  resources :officer, :controller => 'officer'
  scope '/dashboard' do
    resources :officer
  end
  resources :reports
  resources :cars do
    collection do
      post 'render_widgets', :action => :renderWidgets
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
