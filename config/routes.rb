Rails.application.routes.draw do
  resources :games, except: [:show] do
    collection do
      get '/play' => 'games#play'
    end
  end
  resources :scores, only: [:create]
  resources :confessionals, except: [:show, :edit, :update]
  resources :votes, except: [:show]
  resources :info_posts, except: [:index, :show]
  resources :posts, except: [:index, :show]
  resources :polls, only: [:create]
  devise_for :users

  root 'welcome#index'

  get '*path' => redirect('/')
end
