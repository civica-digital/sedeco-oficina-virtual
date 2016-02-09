class Appointment < ActiveRecord::Base
 	validates :name, :email, :scheduled_date, presence: true
 	validates_numericality_of :phonenumber, :on => :create, :message => I18n.t('appointment.errors.numbers')
 	validates :phonenumber, presence: true, length: { is: 10, :message => I18n.t('appointment.errors.length')}
end
