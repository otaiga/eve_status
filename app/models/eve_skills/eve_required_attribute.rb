module EveSkills
  # Belongs to skill
  class EveRequiredAttribute < ActiveRecord::Base
    belongs_to :eve_skill
  end
end
