Rails.application.routes.draw do

  get 'login' => 'sessions#new', :as => :login
  delete 'logout' => 'sessions#destroy', :as => :logout
  resources :sessions, only: [:create]

  # get 'sessions/new'
  #
  # get 'sessions/create'
  #
  # get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
