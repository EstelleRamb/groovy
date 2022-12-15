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
    @users_vinyls = @vinyl.users_vinyls
                          .available_for_trade
                          .without_user(current_user.id)
    # users = @users_vinyls.map { |users_vinyl| users_vinyl.user }
    users_id = @users_vinyls.map { |users_vinyl| users_vinyl.user_id }
    users = User.where(id: users_id)
    @markers = users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user })
      }
    end
  end

  # private

  # def vinyl_params
  #   params.require(:vinyl).permit(:title, :year, :artist_id, :genre_id, :photo_url)
  # end
end
