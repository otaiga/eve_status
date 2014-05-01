module EveDataFetcher
  # Eve api endpoints
  module Eve
     # When called with version=1
     # it returns only the alliances not the member corporations
    def alliance_info
      # Optional : ?version=1
      response = call_eve('eve/AllianceList.xml.aspx')
      response.parsed_response
    end

    # can accept comma separated list
    def charater_ids_for_names(name_list)
      return 'requires a name' unless name_list
      name_list = name_list.gsub(' ', '')
      response = call_eve("eve/CharacterID.xml.aspx?names=#{name_list}")
      response.parsed_response
    end

    def character_names_for_ids(id_list)
      return 'requires an id' unless id_list
      id_list = id_list.gsub(' ', '')
      response = call_eve("eve/CharacterName.xml.aspx?IDs=#{id_list}")
      response.parsed_response
    end

    # Not sure how you get the args
    def character_info(key_id, v_code, character_id)
      return unless key_id && v_code && character_id
      params = "key_id=#{key_id}&v_code=#{v_code}&character_id=#{character_id}"
      response = call_eve("eve/CharacterInfo.xml.aspx?#{params}")
      response.parsed_response
    end

    def conquerable_stations
      response = call_eve('eve/ConquerableStationList.xml.aspx')
      response.parsed_response
    end

    def factional_warfare_stats
      response = call_eve('eve/FacWarStats.xml.aspx')
      response.parsed_response
    end

    def reference_types
      response = call_eve('eve/RefTypes.xml.aspx')
      response.parsed_response
    end

    def skill_tree
      response = call_eve('eve/SkillTree.xml.aspx')
      skill_response(response.parsed_response)
    end
  end
end
