Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'
  get 'home/help'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#show"

  post 'users/new', to: 'users#create'
  post 'reviews/new', to: 'reviews#create'
  post 'restaurant_reviews/new', to: 'restaurant_reviews#create'
  resources :users
  resources :login
  resources :main
  resources :foods
  resources :reviews
  resources :restaurant_reviews
  resources :restaurants
  resources :records
  resources :friends do
    collection do
      post :selected
    end
  end
  get 'friends/add/:request_id', to:'friends#add'
  get 'friends/remove/:request_id', to:'friends#remove'
  get '/eat', action: :eat, controller: 'friends'
  delete 'reviews/:id', to: 'reviews#destroy'
  get '/query', to: 'foods#query'
end
