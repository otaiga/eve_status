# Alliance ingestion support for rake
class AllianceIngestion
  class << self
    def ingest_alliances
      data = call_eve_alliance
      update_alliance_data(data)
    end

    def call_eve_alliance
      EveDataFetcher::Eve.alliance_info
    end

    def update_alliance_data(data)
      return if data[:alliance_groups].empty?
      data[:alliance_groups].each do |group|
        alliance = EveAlliances::EveAlliance.find_or_create_by(
          alliance_id: group[:alliance_id]
        )
        alliance.update_attributes(
          group.as_json except: [:member_corporations]
        )
        update_corp_groups(alliance, group[:member_corporations])
      end
    end

    def update_corp_groups(alliance, corp_data)
      return if corp_data.empty?
      corp_data.each do |member_corp|
        corp = alliance.eve_member_corporations.find_or_create_by(
          corporation_id: member_corp[:corporation_id]
        )
        corp.update_attributes(member_corp.as_json)
      end
    end
  end
end
