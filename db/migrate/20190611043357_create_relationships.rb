class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :followed_id
      t.text :followed_type
      t.integer :follower_id
      t.timestamps
    end
    add_index :relationships, :follower_id
  end
end
