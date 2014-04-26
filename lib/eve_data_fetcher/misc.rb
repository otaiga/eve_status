module EveDataFetcher
  # Misc api endpoints
  module Misc
    def server_status
      response = call_eve('server/ServerStatus.xml.aspx')
      response.parsed_response
    end
  end
end
