module Api
  module V1
    class TestsController < ApiController
      def create
        validated_params = validated_test_params
        validated_params[:user_id] = current_user.id
        service_res = TestsService.create_test(validated_params)
        unless service_res[:success]
          render json: { errors: service_res[:errors] }, status: :unprocessable_entity
          return
        end
        render json: { test: service_res[:test] }, status: :created
      end

      private

      def validated_test_params
        params.permit(:image, :test_type, :strip_code)
      end
    end
  end
end
