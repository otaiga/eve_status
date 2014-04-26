require 'httparty'
require_relative 'eve_data_fetcher/eve'
require_relative 'eve_data_fetcher/maps'
require_relative 'eve_data_fetcher/misc'

# Get General data using eve apis
module EveDataFetcher
  class << self
    include EveDataFetcher::Eve
    include EveDataFetcher::Maps
    include EveDataFetcher::Misc

    private

    def call_eve(str)
      HTTParty.get(base_url + str)
    end

    def base_url
      'https://api.eveonline.com/'
    end
  end
end
