class JobApplicationsController < ApplicationController

    def create
        @job_application = JobApplication.new(user_id: current_user.id, job_offer_id: params[:job_offer_id])
        if @job_application.save
         
          redirect_to job_offers_path, notice: 'Postulación exitosa.'
        else
          redirect_to job_offers_path, alert: 'Error al postular.'
        end
      end
      
end
