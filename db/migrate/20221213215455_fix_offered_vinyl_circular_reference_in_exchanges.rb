class FixOfferedVinylCircularReferenceInExchanges < ActiveRecord::Migration[7.0]
  def change
    remove_reference :exchanges, :offered_vinyl, index: true
    add_reference :exchanges, :offered_vinyl, foreign_key: { to_table: :users_vinyls }
  end
end
