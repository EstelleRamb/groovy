class MessagesController < ApplicationController
  def create
    @exchange = Exchange.find(params[:exchange_id])
    @message = Message.new(message_params)
    @message.user = current_user
    @message.exchange = @exchange

    if @message.save
      ExchangeChannel.broadcast_to(
        @exchange,
        message: render_to_string(partial: "message", locals: {message: @message}),
        sender_id: @message.user.id
      )
      head :ok
    else
      render "exchanges/show", status: :unprocessable_entity
    end
  end
    
private
    
  def message_params
    params.require(:message).permit(:content)
  end    
end
