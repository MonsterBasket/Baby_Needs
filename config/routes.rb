Rails.application.routes.draw do
  resources :problems, :lost_items, :application, :users
end
