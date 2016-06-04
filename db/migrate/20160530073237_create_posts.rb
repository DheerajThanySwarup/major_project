class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :tag
      t.text :description
      t.integer :user_id
      t.string :index

      t.timestamps null: false
    end
  end
end
