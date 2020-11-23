Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth/v1/user'
  mount LetterOpenerWeb::Engine, at: "/email" if Rails.env.development?
  #for heroku
  # mount LetterOpenerWeb::Engine, at: "/email"

  namespace :admin do
    namespace :v1 do
      get 'home', to: 'home#index'
      resources :categories
      resources :coupons
      resources :games
    end
  end

  namespace :storefront do
    namespace :v1 do
    end
  end
end
