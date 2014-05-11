module EveDataFetcher
  # Misc api endpoints
  class Misc < EveDataFetcher::Base
    class << self
      def server_status
        response = call_eve('server/ServerStatus.xml.aspx')
        status = response.parsed_response
        status_result(status)
      end

      private

      def status_result(status)
        return {} unless status
        result = status['eveapi']['result']
        players = result['onlinePlayers']
        server = result['serverOpen'] == 'True' ? 'UP' : 'DOWN'
        {
          server_stat: server,
          online_players: players
        }
      end
    end
  end
end
