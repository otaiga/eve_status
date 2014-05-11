module Api
  # misc api calls
  class MiscApisController < API::BaseController
    def server_stats
      respond_to do |format|
        format.json { render json: EveDataFetcher::Misc.server_status.to_json }
      end
    end
  end
end
