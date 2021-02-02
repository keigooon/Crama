class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :teacher, foreign_key: true
      t.references :student, foreign_key: true
      t.date :lesson_date
      t.string :subject
      t.string :teaching_material
      t.string :unit

      t.timestamps
    end
  end
end
