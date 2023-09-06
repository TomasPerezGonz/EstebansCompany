class UsersController < Devise::RegistrationsController
  before_action :authenticate_user!
  skip_before_action :require_no_authentication, only: [:new, :create]
  before_action :authenticate_admin, only: [:index, :new, :create, :edit, :update]

  def new
    Rails.logger.info "Entrando al método new"
    @new_user = User.new
    self.resource = @new_user
  end

  def index
    @users = User.all
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      redirect_to users_index_path, notice: 'Usuario creado exitosamente.'
    else
      @users = User.all
      render :index
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_index_path, notice: 'Usuario actualizado exitosamente.'
    else
      render :edit
    end
  end

  private

  def authenticate_admin
    Rails.logger.info "Entrando al método authenticate_admin"
    if current_user.nil?
      redirect_to new_user_session_path, alert: 'Necesitas iniciar sesión para realizar esta acción.'
    elsif !current_user.admin?
      redirect_to root_path, alert: 'No tienes permiso para realizar esta acción.'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :photo, :admin)
  end

  def set_minimum_password_length 
    @minimum_password_length = User.password_length.min
  end
end
