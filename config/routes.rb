Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get 'lists', to: 'lists#index'
  # get 'lists/new', to: 'lists#new'
  # post 'lists', to: 'lists#create'
  # get 'lists/:id', to: 'lists#show', as: "list"

  root to: 'lists#index', as: :lists
  resources :lists, except: :index do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: %i[destroy]

  # get 'lists/:id/bookmarks/new', to: "bookmarks#new"
  # get 'lists/:id/bookmarks', to: "bookmarks#create"
end

# index, show, new, create
# bookmarks
# new, create, destroy
