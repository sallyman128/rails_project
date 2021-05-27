class CreateGalleryPaintings < ActiveRecord::Migration[6.1]
  def change
    create_table :gallery_paintings do |t|
      t.integer :gallery_id
      t.integer :painting_id

      t.timestamps
    end
  end
end
