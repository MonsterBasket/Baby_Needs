Rails.application.routes.draw do
  resources :problems, :lost_items
  resources :users, only: [:new, :edit, :create, :show, :index] do 
    resources :items, only: [:create, :show, :index, :destroy] # I have no idea what this does
  end

  root to: 'application#index'

  # authentication
  get '/login',     to: 'users#login'
  # get '/logout',    to: 'users#logout'
  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'

  # put 'problem/:id/like',    to: 'problems#like',          as: 'problem_like'
  # put 'problem/:id/dislike', to: 'problems#dislike',       as: 'problem_dislike'
  post 'comments/new',       to: 'comments#create',        as: 'new_comment'
  # put 'comment/:id/like',    to: 'comments#like',          as: 'comment_like'
  # put 'comment/:id/dislike', to: 'comments#dislike',       as: 'comment_dislike'
  post 'likes/new',          to: 'likes#create_or_delete', as: 'new_like'
  #put 'solution/:id/like', to: 'solutions#like', as: 'like'
  #put 'comment/:id/like', to: 'comments#like', as: 'like'
end
