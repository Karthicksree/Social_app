class ChangeDateTimeToDateProfiles < ActiveRecord::Migration
  def change
  	change_column :profiles, :birth_day, :date
  end
end
