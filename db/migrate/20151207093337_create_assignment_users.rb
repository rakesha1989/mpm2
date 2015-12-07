class CreateAssignmentUsers < ActiveRecord::Migration
  def change
    create_table :assignment_users do |t|
      t.integer :assignment_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
