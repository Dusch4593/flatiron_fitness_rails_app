Rails.application.routes.draw do
  # Top to Bottom --> Specific to Less Specific
  get '/welcome', to: "welcome#home", as: "welcome_page"
  resources :routine_exercises
  resources :exercises
  resources :routines
  resources :routines do
    resources :exercises
  end

  devise_for :users
  root to: "routines#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
