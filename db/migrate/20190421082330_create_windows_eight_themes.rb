class CreateWindowsEightThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :windows_eight_themes do |t|
      t.integer :admin_user_id
      t.integer :user_id
      t.integer :views
      t.integer :system_id
      t.string :download
      t.string :guide
      t.string :name
      t.string :description
      t.string :photos

      t.timestamps
    end
  end
end
