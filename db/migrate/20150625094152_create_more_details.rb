class CreateMoreDetails < ActiveRecord::Migration
  def change
    create_table :more_details do |t|
      t.string :blood_group
      t.string :emergency_contact_1
      t.string :country
      t.string :state
      t.string :city
      t.timestamps null: false
    end
  end
end
