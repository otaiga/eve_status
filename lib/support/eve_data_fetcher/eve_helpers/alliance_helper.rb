module EveHelpers
  # Help weed out the alliance data in nice format
  module AllianceHelper
    def alliance_response(alliance_response)
      alliance_groups = []
      alliance_default_rows(alliance_response).each do |row|
        alliance_groups << alliance_hash(row)
      end
      { alliance_groups: alliance_groups }
    end

    def alliance_hash(row)
      {
        name: row['name'],
        short_name: row['shortName'],
        alliance_id: row['allianceID'],
        executor_corp_id: row['executorCorpID'],
        member_count: row['memberCount'],
        start_date: row['startDate'],
        member_corporations: alliance_member_corps(row)
      }
    end

    def alliance_default_rows(response)
      response['eveapi']['result']['rowset']['row']
    end

    def alliance_member_corps(row)
      member_array = []
      members = alliance_member_row(row)
      if members.kind_of?(Hash)
        member_array << alliance_member_hash(members)
      else
        alliance_member_row(row).each do |member|
          member_array << alliance_member_hash(member)
        end
      end
      member_array
    end

    def alliance_member_row(row)
      row['rowset']['row']
    end

    def alliance_member_hash(member)
      if member.kind_of?(Hash)
        {
          corporation_id: member['corporationID'],
          start_date: member['startDate']
        }
      end
    end
  end
end
