class ChangeColumnInAssignments < ActiveRecord::Migration
  def up
  	change_column :assignments, :due_at, :datetime
  end

  def down
  	change_column :assignments, :due_at, :date
	end

end

