class ExchangesController < ApplicationController
  def index

  end
  def create
    @vinyl = Vinyl.new(vinyl_params)
    @collection_vinyl = Collection_vinyl.find(params[:collection_vinyl_id])
    @vinyl.collection_vinyl = @collection_vinyl
    if @vinyl.save
      redirect_to collection_vinyl_path(@collection_vinyl)
    else
      render '/', status: :unprocessable_entity
    end
  end

  def update_status
  end

  def update_offered_viny
  end

  private

  def vinyl_params
    params.require(:vinyl).permit(:status, :requested_vinyl_id, :user_id, :offered_vinyl_id)
  end
end
