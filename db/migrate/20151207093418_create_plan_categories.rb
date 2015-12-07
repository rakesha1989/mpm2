class CreatePlanCategories < ActiveRecord::Migration
  def change
    create_table :plan_categories do |t|
      t.integer :plan_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
