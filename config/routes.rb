Rails.application.routes.draw do
  resources :confessionals, except: [:show, :edit, :update]
  resources :votes, except: [:show]
  resources :info_posts, except: [:index, :show]
  resources :posts, except: [:index, :show]
  resources :polls, only: [:create]
  devise_for :users

  root 'welcome#index'

  get '*path' => redirect('/')
end
