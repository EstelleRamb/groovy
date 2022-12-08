class CollectionsVinylsController < ApplicationController
  before_action :set_vinyl, except: :destroy

  def destroy
    @vinyl = Vinyl.find(params[:id])
    @vinyl.destroy
    redirect_to vinyl_path, status: :see_other
  end

  def new
    @collection_vinyl = CollectionVinyl.new

  end

  def create
    @collection_vinyl = CollectionVinyl.new(collection_vinyl_params)
    @collection_vinyl.vinyl = @vinyl

    if @collection_vinyl.save
      redirect_to collection_path(@collection_vinyl.collection)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_vinyl
    @vinyl = Vinyl.find(params[:vinyl_id])
  end

  def collection_vinyl_params
    params.require(:collection_vinyl).permit(:collection_id, :offer_for_trade)
  end
end
