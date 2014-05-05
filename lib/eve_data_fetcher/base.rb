module EveDataFetcher
  # Base calls common in all modules
  class Base
    class << self
      def call_eve(str)
        HTTParty.get(base_url + str)
      end

      def base_url
        'https://api.eveonline.com/'
      end
    end
  end
end
