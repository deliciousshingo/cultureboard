class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :title, null: false
      t.text :information, null: false
      t.integer :genre_id, null: false
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
