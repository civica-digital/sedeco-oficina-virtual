class Appointment < ActiveRecord::Base
  validates :name, :phonenumber, :email, :scheduled_date, presence: true
end
