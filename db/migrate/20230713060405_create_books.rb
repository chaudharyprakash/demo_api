class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.boolean :checked_out
      t.references :library, null: false, foreign_key: true
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
  end
end
