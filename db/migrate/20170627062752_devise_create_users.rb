class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string :avatar
      t.string :remember_digest
      t.boolean :is_admin
      t.boolean :status

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
