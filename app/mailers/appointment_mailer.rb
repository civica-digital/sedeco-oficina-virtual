class AppointmentMailer < ActionMailer::Base
  default from: "asesorenlinea@sedeco.mx"

  def new_appointment_notification(appointment, admin_email)
    @appointment = appointment
    mail to: admin_email, subject: I18n.t(".appointment_mailer.new_appointment_notification.subject")
  end

  def new_appointment_user_notification(appointment)
    @appointment = appointment
    mail to: @appointment.email, subject: I18n.t(".appointment_mailer.new_appointment_notification.subject")
  end


end