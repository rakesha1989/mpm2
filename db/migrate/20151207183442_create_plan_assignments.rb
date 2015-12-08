class CreatePlanAssignments < ActiveRecord::Migration
  def change
    create_table :plan_assignments do |t|
      t.integer :plan_id
      t.integer :assignment_id

      t.timestamps null: false
    end
  end
end
