class Appointment < ActiveRecord::Base
 	validates :name, :email, :scheduled_date, presence: true
 	validates_numericality_of :phonenumber, :on => :create,:message => "El teléfono solo debe tener números"
 	validates :phonenumber, presence: true, length: { is: 10,:message => "El teléfono debe tener 10 dígitos"}
end
