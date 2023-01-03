Rails.application.routes.draw do
  LOCALES = /en|pt\-BR/

  scope :"(locale)", locale: LOCALES do
    resources :rooms, :users
  end
  
  get '/:locale' => 'home#index', locale: LOCALES
  root "home#index"
end
