class ExchangesController < ApplicationController
  before_action :set_exchange, only: [:update, :complete_exchange]

  def index
    @exchanges = current_user.exchanges
    @incoming_exchanges = current_user.incoming_exchanges
  end

  def show
    @exchange = Exchange.last
    @message = Message.new
  end

  def create
    exchange = Exchange.new(requested_vinyl_id: params[:users_vinyl_id], user: current_user, status: :pending)
    exchange.save!
    params[:collection_vinyl_ids].each do |cvid|
      offered_vinyls = OfferedVinyl.new(exchange: exchange, users_vinyl_id: cvid)
      offered_vinyls.save!
    end
    redirect_to my_exchanges_path
    # rescue
    # render :new, status: :unprocessable_entity
  end

  def update
    offered_vinyl = OfferedVinyl.find(exchange_params[:offered_vinyl_id]).users_vinyl
    @exchange.offered_vinyl = offered_vinyl
    if @exchange.save
      redirect_to my_exchanges_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  def new
    @users_vinyls_to_offer = current_user.users_vinyls_to_exchange.includes(:vinyl)
    @requested_vinyl = UsersVinyl.find(params[:users_vinyl_id])
    @exchange = Exchange.new
  end

  def complete_exchange
    requested_users_vinyl = @exchange.requested_vinyl
    offered_users_vinyl = @exchange.offered_vinyl

    requested_users_vinyl.destroy
    offered_users_vinyl.destroy

    UsersVinyl.create(
      user: requested_users_vinyl.user,
      vinyl: offered_users_vinyl.vinyl
    )

    UsersVinyl.create(
      user: offered_users_vinyl.user,
      vinyl: requested_users_vinyl.vinyl
    )
    redirect_to collections_path
  end

  private

  def exchange_params
    params.require(:exchange).permit(:offered_vinyl_id)
  end

  def set_exchange
    @exchange = Exchange.find(params[:id])
  end
end
