Rails.application.routes.draw do
  resources :articles do
    resources :comments, only: [:create, :destroy, :update]
  end
  devise_for :user, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root 'welcome#index'
  get "/contact", to: "welcome#contact"
  get "/dashboard", to: "welcome#dashboard"  
  get "/index",to: "welcome#index"
  put "/articles/:id/publish", to: "articles#publish"
  
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup

end
