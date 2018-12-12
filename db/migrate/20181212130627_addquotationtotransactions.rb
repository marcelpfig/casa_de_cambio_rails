class Addquotationtotransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :quotation, :float
  end
end
