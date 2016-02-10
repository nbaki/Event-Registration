class CreateStatusTable < ActiveRecord::Migration
  def change
    create_table :status, force: true, primary_key: 'registrant_id' do |t|
      t.string :status, null: false, limit: 50
      t.timestamps
    end

    add_foreign_key :status, :registrants, column: 'registrant_id', name: 'registrant_id_fk'
  end
end
