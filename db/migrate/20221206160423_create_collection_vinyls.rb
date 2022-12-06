class CreateCollectionVinyls < ActiveRecord::Migration[7.0]
  def change
    create_table :collection_vinyls do |t|
      t.references :vinyl, null: false, foreign_key: true
      t.references :collection, null: false, foreign_key: true
      t.boolean :offer_for_trade

      t.timestamps
    end
  end
end
