class CreateEveRequiredAttributes < ActiveRecord::Migration
  def change
    create_table :eve_required_attributes do |t|
      t.string :primary_attribute
      t.string :secondary_attribute
      t.integer :eve_skill_id
      t.timestamps
    end
  end
end