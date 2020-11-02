Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth/v1/user'
  mount LetterOpenerWeb::Engine, at: "/email" if Rails.env.development?
  #for heroku
  # mount LetterOpenerWeb::Engine, at: "/email"
end
