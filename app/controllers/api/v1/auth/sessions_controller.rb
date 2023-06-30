module Api
  module V1
    module Auth
      class SessionsController < DeviseTokenAuth::SessionsController
        protect_from_forgery with: :null_session
      end
    end
  end
end