module Admins
  def self.admins_email
    ENV["admin_emails"].split(", ")
  end
end