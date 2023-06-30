module Api
  module V1
    module Auth
      class PasswordsController < DeviseTokenAuth::PasswordsController
        protect_from_forgery with: :null_session
      end
    end
  end
end