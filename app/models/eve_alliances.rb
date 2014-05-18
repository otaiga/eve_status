# Patch for the alliances module
module EveAlliances
  def self.table_name_prefix
    'eve_alliances_'
  end
end
