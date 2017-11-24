Rails.application.routes.draw do

  root 'sessions#new'
  get 'login' => 'sessions#new', :as => :login
  delete 'logout' => 'sessions#destroy', :as => :logout
  resource :sessions, only: [:create]

  resource :user, except: [:index] do
    member do
      patch :pin_task
    end
  end

  resources :projects do
    resources :members
    resources :tasks do
      member do
        patch :completed
      end
    end
    resources :messages, except: [:show, :new]
  end

  # get 'sessions/new'
  #
  # get 'sessions/create'
  #
  # get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
