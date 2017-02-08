Rails.application.routes.draw do

  root 'pages#home'

  get '/dashboard' => 'dashboard#index'
  get '/dashboard/officers' => 'dashboard#officers'
  get '/dashboard/authorizations' => 'dashboard#authorizations'
  get '/dashboard/activity' => 'dashboard#activity'

  devise_for :officers
  devise_scope :officers do
    get  'officer/new' => 'officer#new'
    post 'officer/new' => 'officer#create'
  end
  resources :officers, :controller => 'officers'
  scope '/dashboard' do
    resources :officers
  end
  resources :reports
  resources :cars do
    collection do
      post 'render_widgets', :action => :renderWidgets
    end
  end
  resources :officers do
    collection do
      post 'change_officer', :action => :changeOfficer
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
