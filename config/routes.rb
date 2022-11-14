Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: :index
  resources :sessions, only: [] do
    collection do
      get :login
      post :login_request
      get :signup
      post :signup_request
    end
  end

  root to: 'users#index'
end
