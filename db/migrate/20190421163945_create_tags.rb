class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.integer :system_id
      t.string :object_type
      t.integer :object_id

      t.timestamps
    end
  end
end
