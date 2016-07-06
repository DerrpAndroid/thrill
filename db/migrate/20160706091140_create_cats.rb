class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.integer :tag_id
      t.integer :taggable_id

      t.timestamps null: false
    end
  end
end
