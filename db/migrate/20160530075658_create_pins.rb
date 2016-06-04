class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.text :tag
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :pins, :user_id
  end
end
