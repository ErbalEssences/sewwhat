class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :skill
      t.string :avatar_url
      t.boolean :admin

      t.timestamps
    end
  end
end
