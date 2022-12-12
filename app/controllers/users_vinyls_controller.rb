class UsersVinylsController < ApplicationController

  def create

    @users_vinyl = UsersVinyl.new
    @users_vinyl.user = current_user
    @vinyl = Vinyl.find(params[:vinyl_id])
    @users_vinyl.vinyl = @vinyl
    @users_vinyl.save
    # if @users_vinyl.save
      redirect_to vinyls_path(query: params[:query]), notice: "#{@vinyl.title} a été ajouté à votre collection"
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  def new
    @users_vinyl = UserVinyl.new
  end

  def update
    @users_vinyl = UsersVinyl.find(params[:id])
    @users_vinyl.update(users_vinyl_params)
  end

  private

  def users_vinyl_params
    params.require(:users_vinyl).permit(:offer_for_trade)
  end
end
