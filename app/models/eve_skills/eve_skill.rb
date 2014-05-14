module EveSkills
  # Belongs to eve group
  class EveSkill < ActiveRecord::Base
    belongs_to :eve_skill_grp
    has_many :eve_required_skills
    has_many :eve_required_attributes
    has_many :eve_skill_bonus_collections
  end
end
