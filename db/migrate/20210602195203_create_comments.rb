class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :message
      t.integer :user_id
      t.integer :painting_id
      t.timestamps
    end
  end
end
