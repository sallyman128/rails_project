class CreateClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :classes do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.timestamps
    end
  end
end
