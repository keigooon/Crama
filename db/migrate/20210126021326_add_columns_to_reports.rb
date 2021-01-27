class AddColumnsToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :lesson_date, :string
    add_column :reports, :subject, :string
    add_column :reports, :teaching_material, :string
    add_column :reports, :exercise, :string
    add_column :reports, :comprehension_lesson, :integer
    add_column :reports, :attitude, :integer
    add_column :reports, :done_homework, :string
    add_column :reports, :comprehension_homework, :integer
    add_column :reports, :homework, :string
  end
end
