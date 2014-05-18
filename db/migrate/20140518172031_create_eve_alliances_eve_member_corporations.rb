class CreateEveAlliancesEveMemberCorporations < ActiveRecord::Migration
  def change
    create_table :eve_alliances_eve_member_corporations do |t|
      t.integer :eve_alliances_id
      t.integer :corporation_id
      t.datetime :start_date
      t.timestamps
    end
  end
end
