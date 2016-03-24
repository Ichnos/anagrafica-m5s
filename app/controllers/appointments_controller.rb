class AppointmentsController < ApplicationController
    
  before_action :set_appointment, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @appointments = Appointment.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @appointment = Appointment.new
  end
  
  def edit
  end
  
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    if @appointment.save
      flash[:success] = "L'articolo é stato creato con successo"
      redirect_to appointment_path(@appointment)
    else
      render 'new'
    end
  end
  
  def update
    if @appointment.update(appointment_params)
      flash[:success] = "L'articolo é stato aggiornato con successo"
        redirect_to appointment_path(@appointment)
    else
      render 'edit'
    end
  end
  
  def show
  end

  def destroy
    @appointment.destroy
    flash[:danger] = "L'articolo é stato cancellato con successo"
    redirect_to appointments_path
  end
  
  private
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
  
  def appointment_params
    params.require(:appointment).permit(:title)
  end
  
  def require_same_user
    if current_user != @appointment.user and !current_user.admin?
      flash[:danger] = "Puoi modificare solo i tuoi eventi"
      redirect_to root_path
    end
  end
end