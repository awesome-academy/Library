class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :followable_id
      t.text :followable_type
      t.integer :follower_id
      t.timestamps
    end
    add_index :relationships, :follower_id
  end
end
