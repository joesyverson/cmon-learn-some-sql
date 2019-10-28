class ChangeColumnSaleInSaleToAmount < ActiveRecord::Migration[6.0]
  def change
    rename_column :sales, :sale, :amount
  end
end
