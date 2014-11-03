class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.string :cell_phone
      t.datetime :birth_day
      t.integer :gender
      t.string :location
      t.references :user, index: true

      t.timestamps
    end
  end
end
