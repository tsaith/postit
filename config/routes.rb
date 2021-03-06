PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts do
    member do
      post :vote
    end

    resources :comments, only: [:create] do
      member do
        post :vote
      end
    end
  end

  resources :categories, except: [:destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/register', to: 'users#new'

  resources :users, only: [:show, :create, :edit, :update]

end
