class JobApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @job_applications = current_user.job_applications.includes(:job_offer)
  end

  def admin_index
    authenticate_admin
    @admin_job_applications = JobApplication.includes(:user, :job_offer).all
  end

  def create
    @job_application = JobApplication.new(user_id: current_user.id, job_offer_id: params[:job_offer_id])
    if @job_application.save
      admins = User.where(admin: true)
      admins.each do |admin|
        Notification.create(user: admin, content: 'Nueva postulación recibida', read: false)
      end
      redirect_to job_offers_path, notice: 'Postulación exitosa.'
    else
      redirect_to job_offers_path, alert: 'Error al postular.'
    end
  end

  def mark_as_read
    @job_application = JobApplication.find(params[:id])
    @job_application.update(read: true)
    redirect_to admin_job_applications_path, notice: 'Postulación marcada como leída.'
  end

  private

  def authenticate_admin
    unless current_user.admin?
      redirect_to root_path, alert: 'No tienes permiso para realizar esta acción.'
    end
  end
end




