class CreateEveMemberCorporations < ActiveRecord::Migration
  def change
    create_table :eve_member_corporations do |t|
      t.integer :eve_alliance_id
      t.integer :corporation_id
      t.datetime :start_date
      t.timestamps
    end
  end
end
