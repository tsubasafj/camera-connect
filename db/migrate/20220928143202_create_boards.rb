class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :title,          null: false
      t.text   :content,        null: false
      t.integer :want_id,       null: false
      t.integer :prefecture_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
