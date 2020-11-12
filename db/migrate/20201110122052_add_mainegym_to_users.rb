class AddMainegymToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :mainegym, :text
  end
end
