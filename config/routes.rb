require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users, :controllers => { 
    :sessions => "users/sessions",
    :registrations => "users/registrations",
    :confirmations => "users/confirmations",
  }, :skip => [:passwords]

  resources :dependents

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
