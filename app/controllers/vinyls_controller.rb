class VinylsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    if params[:query].present?
      @vinyls = Vinyl.search_by_title_and_year(params[:query])
    else
      @vinyls = Vinyl.all
    end
  end

  def show
    @vinyl = Vinyl.find(params[:id])
  end

  private

  def vinyl_params
    params.require(:vinyl).permit(:title, :year, :artist_id, :genre_id, :photo_url)
  end
end
