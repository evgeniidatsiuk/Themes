class CreateChosens < ActiveRecord::Migration[5.2]
  def change
    create_table :chosens do |t|
      t.integer :theme_id
      t.integer :user_id

      t.timestamps
    end
  end
end
