class CreateVinyls < ActiveRecord::Migration[7.0]
  def change
    create_table :vinyls do |t|
      t.string :title
      t.integer :year
      t.text :photo_url
      t.references :artist, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
