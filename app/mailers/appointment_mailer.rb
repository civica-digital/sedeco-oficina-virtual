class AppointmentMailer < ActionMailer::Base
  default from: "oficina_virtual@sedeco.mx"

  def new_appointment_notification(appointment, admin_email)
    @appointment = appointment
    mail to: admin_email, subject: I18n.t(".appointment_mailer.new_appointment_notification.subject")
  end
end