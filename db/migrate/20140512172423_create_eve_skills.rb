class CreateEveSkills < ActiveRecord::Migration
  def change
    create_table :eve_skills do |t|
      t.integer :eve_skill_grp_id
      t.string :type_name
      t.integer :group_id
      t.integer :type_id
      t.text :description
      t.integer :rank
      t.timestamps
    end
  end
end
