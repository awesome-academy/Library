class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :status, default: 0, null: false
      t.datetime :borrowed_day
      t.references :user
      t.references :request_detail
      t.timestamps
    end
  end
end
