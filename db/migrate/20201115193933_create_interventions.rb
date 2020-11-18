class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :author_id, null: false
      t.integer :customer_id, null: false
      t.integer :building_id, null: true
      t.integer :battery_id, null: true
      t.integer :column_id, null: true
      t.integer :elevator_id, null: true
      t.integer :employee_id, null: true
      t.datetime :intervention_start_date_time, null: true
      t.datetime :intervention_end_date_time, null: true
      t.string :status
      t.string :result
      t.text :report
      t.timestamps
    end
  end
end
