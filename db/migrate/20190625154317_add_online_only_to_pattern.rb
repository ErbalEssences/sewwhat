class AddOnlineOnlyToPattern < ActiveRecord::Migration[5.2]
  def change
    add_column :patterns, :online_only, :boolean
  end
end
