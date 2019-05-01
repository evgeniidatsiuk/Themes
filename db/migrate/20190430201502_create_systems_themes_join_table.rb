class CreateSystemsThemesJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_table :systems_themes, id: false do |t|
  		t.integer :system_id
  		t.integer :theme_id
  	end
    add_index :systems_themes, :system_id
    add_index :systems_themes, :theme_id
  end
end
