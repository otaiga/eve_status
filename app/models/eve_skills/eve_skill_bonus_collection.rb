module EveSkills# Belongs to skill
  class EveSkillBonusCollection < ActiveRecord::Base
    belongs_to :eve_skill
  end
end
