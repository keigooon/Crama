class AddLastNameToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :last_name, :string
  end
end
