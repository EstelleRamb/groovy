class WishlistsController < ApplicationController
  def destroy
    @vinyl = Vinyl.find(params[:id])
    @vinyl.destroy
    redirect_to vinyl_path, status: :see_other
  end
end
