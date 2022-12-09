class ChatroomsController < ApplicationController
    def show
        @chatroom = Chatroom.first
        @message = Message.new
    end
end
