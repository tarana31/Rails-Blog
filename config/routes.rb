Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :posts do
    resources :comments
  end

  get '/' => 'users#index'

  get '/signin' => 'sessions#new', as: :new_session
  post '/create-session' => 'sessions#create', as: :create_session

  get '/signout' => 'sessions#destroy', as: :destroy_session
  get '/posts' => 'posts#index'
end
