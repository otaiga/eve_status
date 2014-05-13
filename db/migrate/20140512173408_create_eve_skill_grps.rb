class CreateEveSkillGrps < ActiveRecord::Migration
  def change
    create_table :eve_skill_grps do |t|
      t.string :group_name
      t.timestamps
    end
  end
end
