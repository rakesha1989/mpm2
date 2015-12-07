class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.date :plan_month
      t.datetime :date
      t.integer :company_id
      t.string :category

      t.timestamps null: false
    end
  end
end
