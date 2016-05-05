Rails.application.routes.draw do
  resources :articles do
    resources :comments, only: [:create, :destroy, :update]
  end
  devise_for :users
  root 'welcome#index'
  get "/contact", to: "welcome#contact"
  get "/dashboard", to: "welcome#dashboard"  
  get "/index",to: "welcome#index"
  put "/articles/:id/publish", to: "articles#publish"
  
end
