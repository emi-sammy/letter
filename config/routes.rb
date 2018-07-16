Rails.application.routes.draw do
  resources :feeds
  root to:'letters#top'
  get 'sessions/new'

resources:letters do
    collection do
    post :confirm
    end
 end

resources:sessions,only:[:new,:create,:destroy]
resources:users
resources:favorites,only: [:create, :destroy]

mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
end
