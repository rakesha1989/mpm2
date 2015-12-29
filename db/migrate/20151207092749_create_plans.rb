class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.date :start_date
      t.integer :status_id
      t.integer :meeting_id
      t.integer :priority_id
      t.string :rating

      t.timestamps null: false
    end
  end
end
