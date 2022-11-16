Rails.application.routes.draw do
  resources :problems, :lost_items
  resources :users, only: [:new, :edit, :update, :create, :show, :index] do 
    resources :items, only: [:create, :show, :index, :destroy] # I have no idea what this does
  end

  root to: 'application#index'

  # authentication
  get '/login',     to: 'users#login'
  # get '/logout',    to: 'users#logout'
  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'

  post 'solutions/new', to: 'solutions#create',       as: 'new_solution'
  post 'comments/new',  to: 'comments#create',        as: 'new_comment'
  post 'likes/new',     to: 'likes#create_or_delete', as: 'new_like'
end
