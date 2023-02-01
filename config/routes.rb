Rails.application.routes.draw do
  resources :rooms
  resources :users

  resource :confirmation, only: [:show]


  LOCALES = /en|pt\-BR/

  scope :"(locale)", locale: LOCALES do
    resources :rooms, :users
  end

  get '/:locale' => 'home#index', locale: LOCALES
  root "home#index"
end
