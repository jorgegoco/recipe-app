Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  resources :users
  resources :foods do
    collection do
      get 'new_from_recipe'
      post 'create_from_recipe'
    end
  end
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  resources :public_recipes
  get '/shopping_list/:recipe_id', to: 'shopping_list#show', as: 'shopping_list'
  get '/shopping_list', to: 'shopping_list#index', as: 'general_shopping_list'
end
