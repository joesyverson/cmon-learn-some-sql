class CreateSuperiorInferiors < ActiveRecord::Migration[6.0]
  def change
    create_table :superior_inferiors do |t|
      t.integer :superior_id
      t.integer :inferior_id

      t.timestamps
    end
  end
end
