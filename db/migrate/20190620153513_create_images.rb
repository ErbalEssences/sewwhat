class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :pattern_id
      t.integer :user_id
      t.string :url
      t.boolean :line_art

      t.timestamps
    end
  end
end
