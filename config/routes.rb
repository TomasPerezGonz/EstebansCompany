Rails.application.routes.draw do
  devise_for :users
  resources :job_applications, only: [:create]


  root 'home#index'

end
