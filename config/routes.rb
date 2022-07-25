Rails.application.routes.draw do
  resources :rooms, :users 
  
  root 'home#index'

end
