class AddUserToCvUnits < ActiveRecord::Migration[6.0]
  def change
    add_reference :cv_units, :user, null: false, foreign_key: true
  end
end
