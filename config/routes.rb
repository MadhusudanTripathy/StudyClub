Rails.application.routes.draw do
  root "welcome#index"  
  devise_for :users
  get 'guide/index'
  get 'community/index'
  resources :dashboard, :only => [:index, :new, :create, :edit, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  resources :questions do
    resources :question_reactions
    resources :answers
  end
end
