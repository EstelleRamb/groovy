class RenameChatroomIdToExchangeId < ActiveRecord::Migration[7.0]
  def change
    rename_column :messages, :chatroom_id, :exchange_id
  end
end
