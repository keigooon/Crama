class AddUnitToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :unit, :string
  end
end
