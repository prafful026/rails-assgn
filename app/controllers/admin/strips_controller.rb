module Admin
  class StripsController < ApplicationController
    def index
      @strips = Strip.where(strip_batch_id: params[:strip_batch_id])
    end
  end
end