class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.date :due_at
      t.integer :activity_id
      t.integer :category_id
      t.boolean :is_completed

      t.timestamps null: false
    end
  end
end
