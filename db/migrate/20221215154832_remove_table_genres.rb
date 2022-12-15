class RemoveTableGenres < ActiveRecord::Migration[7.0]
  def change
    remove_reference :vinyls, :genre, index: true
    drop_table :genres
  end
end
