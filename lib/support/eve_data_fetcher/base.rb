module EveDataFetcher
  # Base calls common in all modules
  class Base
    class << self
      BASE_URL = 'https://api.eveonline.com/'

      def call_eve(str)
        HTTParty.get(BASE_URL + str)
      end
    end
  end
end
