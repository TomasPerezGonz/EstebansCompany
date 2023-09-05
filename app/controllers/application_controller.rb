class ApplicationController < ActionController::Base
    before_action :devise_mapping
  
    protected
  
    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end
  end
  
