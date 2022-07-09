class AddSortToCvUnits < ActiveRecord::Migration[7.0]
  def change
    add_column :cv_units, :sort, :integer, default: 0
  end
end
