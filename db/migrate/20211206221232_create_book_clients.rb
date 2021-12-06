class CreateBookClients < ActiveRecord::Migration[6.1]
  def change
    create_table :book_clients do |t|
      t.references :client, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.decimal :final_price

      t.timestamps
    end
  end
end
