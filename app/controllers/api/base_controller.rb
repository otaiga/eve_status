module API
  # API base Controller
  class BaseController < ActionController::Base
    before_action :check_json
    respond_to :json

    def check_json
      render nothing: true, status: 406 unless params[:format] == 'json'
    end
  end
end
