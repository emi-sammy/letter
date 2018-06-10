Rails.application.routes.draw do
  resources :letters do
    collection do
    post :confirm
    end
  end
   root'letters#top'
end

