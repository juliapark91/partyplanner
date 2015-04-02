class CreatePlannedParties < ActiveRecord::Migration
  def change
    create_table :planned_parties do |t|
      t.references :party, index: true
      t.references :guest, index: true

      t.timestamps null: false
    end
    add_foreign_key :planned_parties, :parties
    add_foreign_key :planned_parties, :guests
  end
end
