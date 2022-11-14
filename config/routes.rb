Rails.application.routes.draw do
  resources :problems, :lost_items, :application, :users

  put 'problem/:id/like', to: 'problems#like', as: 'problem_like'
  put 'problem/:id/dislike', to: 'problems#dislike', as: 'problem_dislike'
  post 'comments/new', to: 'comments#create', as: 'new_comment'
  put 'comment/:id/like', to: 'comments#like', as: 'comment_like'
  put 'comment/:id/dislike', to: 'comments#dislike', as: 'comment_dislike'
  #put 'solution/:id/like', to: 'solutions#like', as: 'like'
  #put 'comment/:id/like', to: 'comments#like', as: 'like'
end
