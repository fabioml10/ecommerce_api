Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/email" if Rails.env.development?
  #for heroku
  # mount LetterOpenerWeb::Engine, at: "/email"
end
