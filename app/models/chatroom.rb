class Chatroom < ApplicationRecord
    belongs_to :exchange
    has_many :messages, dependent: :destroy
end
