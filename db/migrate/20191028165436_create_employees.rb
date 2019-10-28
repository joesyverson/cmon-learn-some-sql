class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.date :birth_date
      t.integer :salary
      t.boolean :manager

      t.timestamps
    end
  end
end
