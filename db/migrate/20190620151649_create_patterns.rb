class CreatePatterns < ActiveRecord::Migration[5.2]
  def change
    create_table :patterns do |t|
      t.string :name
      t.string :url
      t.decimal :price, precision: 5, scale: 2
      t.boolean :out_of_print

      t.timestamps
    end
  end
end
