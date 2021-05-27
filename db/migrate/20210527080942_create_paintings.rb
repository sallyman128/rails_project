class CreatePaintings < ActiveRecord::Migration[6.1]
  def change
    create_table :paintings do |t|
      t.string :title
      t.string :artist_name
      t.string :country

      t.timestamps
    end
  end
end
