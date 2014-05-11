module EveDataFetcher
  # Maps api endpoints
  class Maps < EveDataFetcher::Base
    class << self
      def factional_warfare_systems_map
        response = call_eve('map/FacWarSystems.xml.aspx')
        response.parsed_response
      end

      def jumps_map
        response = call_eve('map/Jumps.xml.aspx')
        response.parsed_response
      end

      def kills_map
        response = call_eve('/map/Kills.xml.aspx')
        response.parsed_response
      end

      def sovereignty_map
        response = call_eve('map/Sovereignty.xml.aspx')
        response.parsed_response
      end
    end
  end
end
