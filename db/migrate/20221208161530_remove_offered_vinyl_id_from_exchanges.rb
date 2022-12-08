class RemoveOfferedVinylIdFromExchanges < ActiveRecord::Migration[7.0]
  def change
    remove_reference :exchanges, :offered_vinyl, foreign_key: { to_table: :collection_vinyls }
  end
end
