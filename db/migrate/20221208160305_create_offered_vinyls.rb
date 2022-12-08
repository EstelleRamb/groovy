class CreateOfferedVinyls < ActiveRecord::Migration[7.0]
  def change
    create_table :offered_vinyls do |t|
      t.references :exchange, null: false, foreign_key: true
      t.references :collection_vinyl, null: false, foreign_key: true

      t.timestamps
    end
  end
end
