class AddPlaceToCvUnits < ActiveRecord::Migration[6.0]
  def change
    add_column :cv_units, :location, :string, default: ""
    add_column :cv_units, :company, :string, default: ""
    add_column :cv_units, :job, :string, default: ""
  end
end
