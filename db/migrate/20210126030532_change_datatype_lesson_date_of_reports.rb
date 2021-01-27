class ChangeDatatypeLessonDateOfReports < ActiveRecord::Migration[5.2]
  def change
    change_column :reports, :lesson_date, :date
  end
end
