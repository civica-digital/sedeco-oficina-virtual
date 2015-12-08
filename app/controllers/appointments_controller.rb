class AppointmentsController < ApplicationController
  def index
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      send_new_appointment_notification_email(@appointment)
      redirect_to appointments_path, notice: t(".appointment_created")
    else
      render :index
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:name, :email, :phonenumber, :scheduled_date)
  end

  def send_new_appointment_notification_email(appointment)
    Admins.admins_email.each do |email|
      AppointmentMailer.new_appointment_notification(appointment, email).deliver
    end
  end
end
