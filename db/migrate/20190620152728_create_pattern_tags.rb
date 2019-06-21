class CreatePatternTags < ActiveRecord::Migration[5.2]
  def change
    create_table :pattern_tags do |t|
      t.integer :tag_id
      t.integer :pattern_id

      t.timestamps
    end
  end
end
