Rails.application.routes.draw do
  devise_for :users
  resources :job_applications, only: [:create, :index]
  resources :notifications, only: [] do
    member do
      post :mark_as_read
    end
  end
  
  root 'job_offers#home'

end

