class CreateRegistrantsTable < ActiveRecord::Migration
  def change
    create_table :registrants, force: true, primary_key_trigger: true do |t|
      t.integer :year, null: false, limit: 4
      t.string :first_name, null: false, limit: 50
      t.string :last_name, null: false, limit: 50
      t.date :dob, null: false
      t.string :email, null: false, limit: 100
    end

    add_index :registrants, [:year, :email], unique: true
  end
end
