module EveDataFetcher
  # Misc api endpoints
  class Misc < EveDataFetcher::Base
    class << self
      def server_status
        response = call_eve('server/ServerStatus.xml.aspx')
        response.parsed_response
      end
    end
  end
end
