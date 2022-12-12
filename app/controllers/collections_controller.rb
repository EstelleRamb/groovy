class CollectionsController < ApplicationController
  def index
    @vinyls_to_exchange = current_user.vinyls_to_exchange
    @collections = current_user.collections
    @users_vinyls = current_user.users_vinyls.includes(:vinyl)
  end

  def show
    @collection = Collection.find(params[:id])
    # @collection_vinyl = CollectionVinyl.where(collection_id: @collection)
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    if @collection.save
      redirect_to collections_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :user_id, :photo)
  end
end
