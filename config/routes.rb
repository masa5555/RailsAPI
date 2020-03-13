Rails.application.routes.draw do
  resources :scores
  resources :tasks
  resources :goals
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
end
