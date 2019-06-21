class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :pattern_id
      t.integer :user_id
      t.string :body
      t.boolean :public

      t.timestamps
    end
  end
end
