class CollectionsVinylsController < ApplicationController
  before_action :set_vinyl, except: [:destroy, :create]

  def destroy
    @vinyl = Vinyl.find(params[:id])
    @vinyl.destroy
    redirect_to vinyl_path, status: :see_other
  end

  def new
    @collection_vinyl = CollectionVinyl.new

  end

  def create
    @collections_vinyl = CollectionsVinyl.new(collection_vinyl_params)
    @collections_vinyl.users_vinyl = UsersVinyl.find(params[:users_vinyl_id])
    if @collections_vinyl.save
      redirect_to collection_path(@collections_vinyl.collection)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_vinyl
    @vinyl = Vinyl.find(params[:vinyl_id])
  end

  def collection_vinyl_params
    params.require(:collections_vinyl).permit(:collection_id, :user_vinyl_id)
  end
end
