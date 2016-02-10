class AddForeignKeyToEventYear < ActiveRecord::Migration
  def change
    add_foreign_key :registrants, :event_ref, column: :year, primary_key: :year, name: :event_year_fk
  end
end
