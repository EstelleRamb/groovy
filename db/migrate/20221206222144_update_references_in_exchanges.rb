class UpdateReferencesInExchanges < ActiveRecord::Migration[7.0]
  def change
    remove_column :exchanges, :user_id, :integer
    remove_column :exchanges, :requested_vinyl_id, :integer
    remove_column :exchanges, :offered_vinyl_id, :integer

    add_reference :exchanges, :user, foreign_key: true
    add_reference :exchanges, :requested_vinyl, foreign_key: { to_table: :collection_vinyls }
    add_reference :exchanges, :offered_vinyl, foreign_key: { to_table: :collection_vinyls }

    change_column :exchanges, :status, :integer, null: false, default: 0
  end
end
