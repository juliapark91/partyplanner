class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :title
      t.datetime :started_at
      t.datetime :ended_at
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
