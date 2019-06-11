class CreateRequestDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :request_details do |t|
      t.integer :status, default: 0
      t.datetime :return_day
      t.integer :quantity
      t.references :book
      t.timestamps
    end
  end
end
