class CreateEveSkillBonusCollections < ActiveRecord::Migration
  def change
    create_table :eve_skill_bonus_collections do |t|
      t.integer :eve_skill_id
      t.integer :bonus_value
      t.string :bonus_type
      t.timestamps
    end
  end
end