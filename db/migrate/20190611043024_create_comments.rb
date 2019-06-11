class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :reply_id
      t.references :user
      t.references :book
      t.timestamps
    end
  end
end
