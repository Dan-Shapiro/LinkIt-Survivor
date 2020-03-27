Rails.application.routes.draw do
  resources :votes, except: [:show]
  resources :info_posts, except: [:index, :show]
  resources :posts, except: [:index, :show]
  devise_for :users

  root 'welcome#index'

  get '*path' => redirect('/')
end
