class RemoveForeignKeyOnTableMessage < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :messages, column: :exchange_id 
    add_foreign_key :messages, :exchanges
  end
end
