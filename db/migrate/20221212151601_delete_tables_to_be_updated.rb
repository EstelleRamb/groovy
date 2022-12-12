class DeleteTablesToBeUpdated < ActiveRecord::Migration[7.0]
  def change
    drop_table :offered_vinyls
    drop_table :exchanges
    drop_table :collection_vinyls
  end
end
