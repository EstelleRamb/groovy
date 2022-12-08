class VinylsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    if params[:query].present?
      @vinyls = Vinyl.search_by_title_and_year(params[:query])
    else
      # page d'accueil vide
      @vinyls = []
    end
  end

  def show
    @vinyl = Vinyl.find(params[:id])
    @collections_vinyls = CollectionVinyl.where(vinyl: @vinyl).where(offer_for_trade: true)

    # collections = collections_vinyls.map do |collection_vinyl|
    #   collection_vinyl.collection
    # end
    # users = collections.map do |collection|
    #   collection.user
    # end
    # @markers = users.geocoded.map do |user|
    #   {
    #     lat: user.latitude,
    #     lng: user.longitude
    #   }
    # end
  end

  # private

  # def vinyl_params
  #   params.require(:vinyl).permit(:title, :year, :artist_id, :genre_id, :photo_url)
  # end
end
