class JobApplicationsController < ApplicationController

    def index
      @job_applications = current_user.job_applications
    end
  
    def create
      @job_application = JobApplication.new(user_id: current_user.id, job_offer_id: params[:job_offer_id])
      if @job_application.save
        esteban = User.find_by(email: 'esteban@a.a')
        Notification.create(user: esteban, content: 'Nueva postulación recibida', read: false)
        redirect_to job_offers_path, notice: 'Postulación exitosa.'
      else
        redirect_to job_offers_path, alert: 'Error al postular.'
      end
    end
  
  end