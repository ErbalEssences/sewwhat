class AddCategoryToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :category, :integer
  end
end
