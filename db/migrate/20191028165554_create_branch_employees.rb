class CreateBranchEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :branch_employees do |t|
      t.integer :branch_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
