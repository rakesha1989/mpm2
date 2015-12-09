class DropTable < ActiveRecord::Migration
  def change
  	drop_table :plan_assignments
  end
end
