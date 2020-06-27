Rails.application.routes.draw do

  get 'maps/index'
  get 'maps/create'

  #get 'users/show'
	devise_for :users
	root 'posts#index'
	resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
	    resource :favorites, only: [:create, :destroy]
	    resource :post_comments, only: [:create, :destroy]
	end
	resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
