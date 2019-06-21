class AddDisplayNameToPattern < ActiveRecord::Migration[5.2]
  def change
    add_column :patterns, :display_name, :string
  end
end
