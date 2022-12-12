class CleanUpDatabaseForUpdatePreparation < ActiveRecord::Migration[7.0]
  def change
    execute "DELETE FROM exchanges CASCADE;"
    execute "DELETE FROM collection_vinyls CASCADE;"
  end
end
