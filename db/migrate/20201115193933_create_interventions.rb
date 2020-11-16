class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :employee_id, null: false
      t.integer :building_id, null: false
      t.integer :battery_id, null: true
      t.integer :column_id, null: true
      t.integer :elevator_id, null: true
      t.datetime :intervention_start_date_time, null: true
      t.datetime :intervention_end_date_timee, null: true
      t.string :result, default: 0
      t.text :report
      t.string :status, default: 0
      t.timestamps
    end
  end
end
