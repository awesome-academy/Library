class CreatePublishers < ActiveRecord::Migration[5.2]
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :string
      t.string :address
      t.string :text
      t.string :email
      t.string :string

      t.timestamps
    end
  end
end
