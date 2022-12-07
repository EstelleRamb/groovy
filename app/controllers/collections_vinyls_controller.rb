class CollectionsVinylsController < ApplicationController
  def destroy
    @vinyl = Vinyl.find(params[:id])
    @vinyl.destroy
    redirect_to vinyl_path, status: :see_other
  end

  def new
    @collection_vinyl = CollectionVinyl.new(vinyl_id: params[:vinyl_id])
  end

  def create
    @collection_vinyl = CollectionVinyl.new
    @vinyl = Vinyl.find(params[:vinyl_id])
    @collection = params[:collection_vinyl]
    # @collection_vinyl.user = current_user
    @collection_vinyl.vinyl_id = @vinyl
    @collection_vinyl.collection_id = @collection
    if @vinyl.save
      redirect_to vinyls_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
