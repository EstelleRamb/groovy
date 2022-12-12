class CreateNewAndUpdatedTables < ActiveRecord::Migration[7.0]
  def change
    create_table :users_vinyls do |t|
      t.references :user, foreign_key: true
      t.references :vinyl, foreign_key: true
      t.boolean :offer_for_trade, null: false, default: false
      t.timestamps
    end

    create_table :collections_vinyls do |t|
      t.references :users_vinyl, foreign_key: true
      t.references :collection, foreign_key: true
      t.timestamps
    end

    create_table :exchanges do |t|
      t.integer :status, null: false, default: 0
      t.references :requested_vinyl, foreign_key: { to_table: :users_vinyls }
      t.references :user, foreign_key: true

      t.timestamps
    end

    create_table :offered_vinyls do |t|
      t.references :exchange, foreign_key: true
      t.references :users_vinyl, foreign_key: true

      t.timestamps
    end
  end
end
