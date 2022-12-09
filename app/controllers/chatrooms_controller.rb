class ChatroomsController < ApplicationController
    def show
        @chatroom = Chatroom.find(params[:chatroom_id])
        @message = Message.new
    end
end
