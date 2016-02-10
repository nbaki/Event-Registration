class AddUniqueTokenToRegistrants < ActiveRecord::Migration
  def up
    add_column :registrants, :uuid, :string
    change_column :registrants, :uuid, :string, null: false
    add_index :registrants, :uuid, unique: true
  end

  def down
    remove_column :registrants, :uuid
  end
end
