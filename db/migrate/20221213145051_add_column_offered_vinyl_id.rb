class AddColumnOfferedVinylId < ActiveRecord::Migration[7.0]
  def change
    add_reference :exchanges, :offered_vinyl, null: true, foreign_key: true
  end
end
