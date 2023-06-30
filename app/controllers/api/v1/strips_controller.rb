module Api
  module V1
    class StripsController < ApiController
      def validate
        strip = Strip.get_validated_strip(strip_code = validated_params[:strip_code], test_type = validated_params[:test_type])

        if strip
          render json: { strip: strip }, status: :ok
        else
          render json: { errors: ["Invalid strip"] }, status: :unprocessable_entity
        end
      end

      private

      def validated_params
        params.require(:strip).permit(:strip_code, :test_type)
      end
    end
  end
end
