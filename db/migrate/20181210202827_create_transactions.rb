class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :amount
      t.string :float
      t.string :currency
      t.string :string
      t.string :transaction_type
      t.string :string

      t.timestamps
    end
  end
end
