class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :access_level, default: 0

      t.timestamps null: false
    end
    add_index :users, :email
  end
end
