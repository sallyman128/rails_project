class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :room_number
      t.integer :student_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
