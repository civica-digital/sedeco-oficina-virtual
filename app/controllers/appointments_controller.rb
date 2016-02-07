class AppointmentsController < ApplicationController
  

  def index
    @appointment = Appointment.new
    @array_day_out = ["2016-01-01","2016-02-01","2016-03-21","2016-05-01","2016-09-16","2016-11-21","2016-12-25","2017-01-01"]
   
    Appointment.where("scheduled_date > ?", Date.yesterday.to_date.to_s).each do |appointment|
       if Appointment.where(scheduled_date: appointment.scheduled_date.to_date.to_s).count >= 15
          @array_day_out << appointment.scheduled_date.to_date.to_s
        end
    end
    
    if Time.now.hour >= 12
      @array_day_out << Date.today.to_date.to_s
    end
  end

  def create

    date_user = Appointment.where("scheduled_date > ? AND email = ? ", 
      Date.today.to_date.to_s,
      appointment_params[:email])
    if date_user.blank?
      @appointment = Appointment.new(appointment_params)
      if @appointment.save
        send_new_appointment_notification_email(@appointment)
        redirect_to appointments_path, notice: t(".appointment_created")
      else
        render :index
      end
    else
      redirect_to appointments_path, alert: t(".appointment_not_created",date: date_user.first.scheduled_date.to_date.to_s)
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

    AppointmentMailer.new_appointment_user_notification(appointment).deliver
  end

  
end
