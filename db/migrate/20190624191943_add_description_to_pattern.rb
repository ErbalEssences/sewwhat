class AddDescriptionToPattern < ActiveRecord::Migration[5.2]
  def change
    add_column :patterns, :description, :text
  end
end
