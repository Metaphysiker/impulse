class AddMoreDatesToCvUnits < ActiveRecord::Migration[7.0]
  def change
    add_column :cv_units, :start_date_year, :integer, default: 0
    add_column :cv_units, :start_date_month, :integer, default: 0
    add_column :cv_units, :end_date_year, :integer, default: 0
    add_column :cv_units, :end_date_month, :integer, default: 0
  end
end
