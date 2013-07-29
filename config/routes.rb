ProjectBOA::Application.routes.draw do
  root to: 'users#new'
  get '/sessions/destroy' => 'sessions#destroy', as: 'logout'
  resources :users, only: [:new, :create]
  resources :sessions, only: :create
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :positions, only: :index
  resources :grips, only: :show
  resources :instructional_videos
end
