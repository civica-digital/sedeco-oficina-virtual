class AppointmentsController < ApplicationController
  def index
    @appointment = Appointment.new
  end
end
