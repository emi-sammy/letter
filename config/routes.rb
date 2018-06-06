Rails.application.routes.draw do

  resources :letters
  
  root'letters#top'

end
