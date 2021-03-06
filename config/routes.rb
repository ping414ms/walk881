Walk88::Application.routes.draw do
  get "user_status/index"
  get "user_status/show"
  get "weekly_records/index"
  get '/group_ranking/', :to => 'group_ranking#index'
  get '/group_ranking/by_day', :to => 'group_ranking#by_day'
  resources :user_records
  get '/user_records/user/:user_id', :to => 'user_records#index', :as => :user_records_of_user
  post '/user_records/:id/fitbit', :to => 'user_records#sync_fitbit'
  get '/weekly_records/:user_id', :to => 'weekly_records#index'

  #resources :user_settings
  get '/user_settings', :to => 'user_settings#show'
  get '/user_settings/edit', :to => 'user_settings#edit'
  post '/user_settings/edit', :to => 'user_settings#update'

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks'}

  devise_scope :user do
    get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
  end

  get '/users/:id/picture', :to => 'users#picture'

  root :to => 'home#index'
  get '/', :to => 'home#index', :as => :sign_in_and_redirect
  get '/', :to => 'home#index', :as => :new_user_registration_url

  get '/login_fitbit', :to => 'fitbit#login', :as => :fitbit_login
  get '/callback/fitbit', :to => 'fitbit#callback'
  get '/fitbit_login_success', :to => 'fitbit#login_success', :as => :fitbit_login_success

  resources :user_statuses, :only => %w(index)
  resources :locations, :only => %w(index)

  namespace :api do
    resources :user, :only => %w(index show)
    resources :user_status, :only => %w(index show)
    resources :location, :only => %w(index)
  end
end
