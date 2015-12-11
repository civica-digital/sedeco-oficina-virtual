class AddTitleToResources < ActiveRecord::Migration
   def up
    add_column :resources, :title, :text
    add_column :resources, :description, :text
  end

  def down
    remove_column :resources, :title, :text
    remove_column :resources, :description, :text
  end
end
