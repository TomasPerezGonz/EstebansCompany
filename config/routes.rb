Rails.application.routes.draw do
  devise_for :users
  resources :job_applications, only: [:create]

  resources :notifications, only: [] do
    member do
      post :mark_as_read
    end
  end
  
  root 'home#index'

end
