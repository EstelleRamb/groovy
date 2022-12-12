class ExchangeChannel < ApplicationCable::Channel
  def subscribed
    exchange = Exchange.find(params[:id])
    stream_for(exchange)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
