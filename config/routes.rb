Rails.application.routes.draw do
  # get '/users', to: 'users#index'
  # post '/users', to: 'users#create'
  # get '/users/new', to: 'users#new'
  # get '/users/:id/edit', to: 'users#edit'
  # get '/users/:id/', to: 'users#show'
  # patch '/users/:id/', to: 'users#update'
  # put '/users/:id/', to: 'users#update'
  # delete '/users/:id/', to: 'users#destroy'

  resources :users, only: [:create, :destroy, :index, :show, :update]
  resources :contacts, only: [:create, :destroy, :show, :update]
  resources :contact_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]

  get '/users/:user_id/contacts', to: 'contacts#index'
  get '/users/:user_id/favorite_contacts', to: 'contacts#favorite_contacts'
  patch '/users/:user_id/favorite/:contact_id/', to: 'contacts#new_favorite'

end
