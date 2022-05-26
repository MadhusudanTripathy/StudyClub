Rails.application.routes.draw do
  root "welcome#index"  
  devise_for :users
  resources :dashboard, :only => [:index, :new, :create, :edit, :update]
  resources :questions do
    resources :question_reactions, :only => [:create, :destroy]
    resources :answers do
      resources :answer_reactions, :only => [:create, :destroy]
    end
  end
  get 'welcome/index'
  get 'guide/index'
  get 'community/index'
  get '/category/:tag', :to => 'dashboard#get_category', :as => 'category'
end
