class AppointmentsController < ApplicationController
  def index
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointments_path, notice: t(".appointment_created")
    else
      render :index
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:name, :email, :phonenumber, :scheduled_date)
  end
end
