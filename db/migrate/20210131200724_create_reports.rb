class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.references :lesson, foreign_key: true
      t.text :content
      t.string :exercise
      t.integer :comprehension_lesson
      t.integer :attitude
      t.string :done_homework
      t.integer :comprehension_homework
      t.string :homework

      t.timestamps
    end
  end
end
