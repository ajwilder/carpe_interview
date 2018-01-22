Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/info', to: 'static_pages#info'
  get '/admin_page', to: 'static_pages#admin_page'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :history, :admin_edit
      patch :admin_update
    end
  end


end
