module EveAlliances
  # Belongs to alliances
  class EveMemberCorporation < ActiveRecord::Base
    belongs_to :eve_alliances
  end
end
