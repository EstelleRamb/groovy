class WishlistsController < ApplicationController
  def destroy
    @vinyl = Vinyl.find(params[:id])
  end
end
