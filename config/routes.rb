Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:update, :show, :index]
  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts'
  end
  
  resources :posts, only: [:index] do
    resources :comments, only: [:create, :destroy]
  post '/up-ballot' => 'ballots#up_ballot', as: :up_ballot
  post '/down-ballot' => 'ballots#down_ballot', as: :down_ballot

end

  resources :ballots, only: [:create]
  resources :comments
  
  get 'about' => 'welcome#about'
 
  root to: 'welcome#index'
  
end
