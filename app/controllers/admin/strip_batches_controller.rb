module Admin
  class StripBatchesController < ApplicationController
    before_action :create_strip_batch, only: [:create, :new]

    def index
      @strip_batches = StripBatch.all
    end

    def new
    end

    def create
      @strip_batch = StripBatch.new(validated_params)
      if @strip_batch.save
        redirect_to admin_strip_batches_path, notice: "Batch created successfully"
      else
        flash.now[:alert] = "Something went wrong"
        render 'new'
      end
    end

    private

    def create_strip_batch
      @strip_batch = StripBatch.new
    end

    def validated_params
      params.require(:strip_batch).permit(:manufacturer, :expd, :mfd, :test_type, :batch_size, :hormone_ids => [])
    end
  end
end