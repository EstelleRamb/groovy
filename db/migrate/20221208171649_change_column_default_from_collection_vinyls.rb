class ChangeColumnDefaultFromCollectionVinyls < ActiveRecord::Migration[7.0]
  def change
    change_column :collection_vinyls, :offer_for_trade, :boolean, null: false, default: false
  end
end
