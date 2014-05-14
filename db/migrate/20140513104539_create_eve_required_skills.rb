class CreateEveRequiredSkills < ActiveRecord::Migration
  def change
    create_table :eve_required_skills do |t|
      t.integer :type_id
      t.integer :skill_level
      t.string :name
      t.integer :eve_skill_id
      t.timestamps
    end
  end
end