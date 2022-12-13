class ExchangesController < ApplicationController
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
    @exchange = Exchange.find(params[:id])
    if @exchange.update(exchange_params)
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

  private

  def exchange_params
    params.require(:exchange).permit(:offered_vinyl_id)
  end
end
