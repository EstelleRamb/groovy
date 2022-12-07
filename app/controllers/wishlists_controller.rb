class WishlistsController < ApplicationController
  def destroy
    @vinyl = Vinyl.find(params[:id])
    @vinyl.destroy
    redirect_to vinyl_path, status: :see_other
  end

  def create
    #TODO rajouter méthode create dans routes.rb
    @vinyl = Vinyl.find(params[:id])
    wishlist.create(vinyl_id: @vinyl, user: current_user)
  end

end
