class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.integer :employee_id
      t.integer :client_id
      t.integer :sale

      t.timestamps
    end
  end
end
