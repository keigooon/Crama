class CreateLessonLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_logs do |t|
      t.references :lesson, foreign_key: true
      t.text :remarks

      t.timestamps
    end
  end
end
