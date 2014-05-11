module Api
  # misc api calls
  class MiscApisController < API::BaseController
    def server_stats
      data = EveDataFetcher::Misc.server_status.to_json
      render json: data
    end
  end
end
