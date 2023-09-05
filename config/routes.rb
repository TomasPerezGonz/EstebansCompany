Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users' }
  devise_scope :user do
    get 'users/index', to: 'users#index', as: 'users_index'
    get 'users/new', to: 'users#new', as: 'new_user'
    get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
    patch 'users/:id', to: 'users#update', as: 'user'
  end
  
  get 'admin/job_applications', to: 'job_applications#admin_index', as: 'admin_job_applications'
  
  resources :job_offers, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  resources :job_applications, only: [:create, :index]
  resources :notifications, only: [] do
    member do
      post :mark_as_read
    end
  end

  resources :job_applications, only: [:create, :index] do
    member do
      post :mark_as_read
    end
  end

  
  root 'job_offers#home'
end











