class CreateWindowsSevenThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :windows_seven_themes do |t|
      t.integer :user_id
      t.string :author
      t.integer :views, default: 0
      t.integer :system_id
      t.string :download
      t.string :guide
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
