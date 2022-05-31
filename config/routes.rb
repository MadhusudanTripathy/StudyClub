Rails.application.routes.draw do
  get 'messages/create'
  get 'rooms/index'
  root "welcome#index"  
  devise_for :users
  resources :dashboard, :only => [:index, :new, :create, :edit, :update]
  resources :questions do
    resources :question_reactions, :only => [:create, :destroy]
    resources :answers do
      resources :answer_reactions, :only => [:create, :destroy]
    end
  end
  resources :rooms do
    resources :messages
  end
  get 'welcome/index'
  get 'guide/index'
  get 'community/index'
  get '/category/:tag', :to => 'dashboard#get_category', :as => 'category'
  get '/search', :to => "questions#search"

end
