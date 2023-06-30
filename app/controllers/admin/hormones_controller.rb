module Admin
  class HormonesController < ::ApplicationController
    before_action :create_hormone, only: [:create, :new]

    def index
      @hormones = Hormone.all
    end

    def new
    end

    def create
      @hormone = Hormone.new(validated_hormone_params)
      if @hormone.save
        redirect_to admin_hormones_path
      else
        render 'new'
      end
    end

    private

    def create_hormone
      @hormone = Hormone.new
    end

    def validated_hormone_params
      params.require(:hormone).permit(:name)
    end
  end
end
