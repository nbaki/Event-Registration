class CreateDatesTable < ActiveRecord::Migration
  def change
    create_table :event_ref, force: true, primary_key_trigger: true do |t|
      t.integer :year, null: false, limit: 4
      t.date :event_start, null: false
      t.date :registration_open
      t.date :registration_close
      t.date :registration_reminder
      t.integer :max_registrants, null: false
    end

    add_index :event_ref, :year, unique: true
  end
end
