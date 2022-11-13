Rails.application.routes.draw do
  resources :problems, :lost_items, :application, :users

  put 'problem/:id/like', to: 'problems#like', as: 'problem_like'
  put 'problem/:id/dislike', to: 'problems#dislike', as: 'problem_dislike'
  put 'problem/:id/comment', to: 'problems#comment', as: 'problem_comment'
  #put 'solution/:id/like', to: 'solutions#like', as: 'like'
  #put 'comment/:id/like', to: 'comments#like', as: 'like'
end
