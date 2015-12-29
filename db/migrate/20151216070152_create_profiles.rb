class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.date :d_o_b
      t.string :designation
      t.string :gender
      t.string :skill
      t.string :email
      t.string :mobile

      t.timestamps null: false
    end
  end
end
