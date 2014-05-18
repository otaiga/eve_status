class CreateEveAlliancesEveAlliances < ActiveRecord::Migration
  def change
    create_table :eve_alliances_eve_alliances do |t|
      t.string :name
      t.string :short_name
      t.integer :alliance_id
      t.integer :executor_corp_id
      t.integer :member_count
      t.datetime :start_date
      t.timestamps
    end
  end
end
