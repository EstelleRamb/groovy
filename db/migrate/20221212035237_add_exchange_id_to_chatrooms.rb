class AddExchangeIdToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :exchange_id, :bigint
  end
end
