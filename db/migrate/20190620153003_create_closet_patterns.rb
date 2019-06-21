class CreateClosetPatterns < ActiveRecord::Migration[5.2]
  def change
    create_table :closet_patterns do |t|
      t.integer :closet_id
      t.integer :pattern_id

      t.timestamps
    end
  end
end
