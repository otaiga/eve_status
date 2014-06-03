# Alliances group
module EveAlliances
  # Alliances
  class EveAlliance < ActiveRecord::Base
    has_many :eve_member_corporations
  end
end
