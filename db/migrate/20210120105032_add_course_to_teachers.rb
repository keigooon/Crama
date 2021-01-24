class AddCourseToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :course, :string
  end
end
