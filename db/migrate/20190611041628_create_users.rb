class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.datetime :birthday
      t.string :address
      t.integer :role, default: 0, null: false
      t.integer :gender, default: 0, null: false

      t.timestamps
    end
  end
end
