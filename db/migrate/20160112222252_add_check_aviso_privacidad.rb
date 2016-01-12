class AddCheckAvisoPrivacidad < ActiveRecord::Migration
   def up
    add_column :appointments, :notice_of_privacy, :boolean, :default => true
  end

  def down
    remove_column :appointments, :notice_of_privacy, :boolean
  end
end
