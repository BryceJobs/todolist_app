Rails.application.routes.draw do
 
  

  resources :todo_lists do
  	resources :list_items, only: [:create, :destroy] do
  		member do
  			patch 'completed'
  		end
  	end
  end

  root 'todo_lists#index'
end
