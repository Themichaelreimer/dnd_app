Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :templates, :actors
  resources :sessions, :only => [:new, :create, :destroy]
  root to: 'templates#index'

  post '/rate' => 'sessions#destroy', :as => 'rate' #It's easier to keep ratyrate than remove it

  get '/signup' => 'users#new'
  get '/logout' => 'sessions#destroy'
  get '/login' => 'sessions#new'
  post '/users' => 'users#create'

  post '/create_monster', to: 'templates#create_monster', as: 'create_monster'
  post '/favorite', to: 'templates#favorite', as: 'favorite'
  post '/unfavorite', to: 'templates#unfavorite', as: 'unfavorite'
  patch '/damage', to: 'actors#damage', as: 'damage'

end
