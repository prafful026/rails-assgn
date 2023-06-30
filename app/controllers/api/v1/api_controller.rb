module Api
  module V1
    class ApiController < ::ApplicationController
      respond_to :json
      include DeviseTokenAuth::Concerns::SetUserByToken

      before_action :authenticate_user!
      skip_before_action :verify_authenticity_token

    end
  end
end
