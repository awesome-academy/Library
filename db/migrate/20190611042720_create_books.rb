class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :description
      t.integer :number_of_pages
      t.integer :publishing_year
      t.integer :number_of_books
      
      t.references :category
      t.references :publisher

      t.timestamps
    end
  end
end
