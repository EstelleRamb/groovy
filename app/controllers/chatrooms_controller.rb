class ChatroomsController < ApplicationController
    def show
        @chatroom = Chatroom.find(params[:id, :exchange_id])
        @message = Message.new
    end
end
