class AddPhotosToWindowsSevenThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :windows_seven_themes, :photos, :string
  end
end
