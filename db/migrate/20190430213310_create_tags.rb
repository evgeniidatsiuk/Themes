class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.integer :category_id
      t.integer :object_id
      t.string :object_type

      t.timestamps
    end
  end
end
