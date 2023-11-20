Rails.application.routes.draw do
  resources :questions
  resources :media
  resources :recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  get "/recipes/:id/steps" => "recipes#steps"
  
  put '/recipes/reorder' => "recipes#reorder"
  put '/recipe_steps/reorder' => "recipe_steps#reorder"
  
  resources :recipe_steps
  # Defines the root path route ("/")
  # root "articles#index"
end
