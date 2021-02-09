class AddMoreInfoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :personal_number, :string, default: ""
    add_column :users, :unemployment_insurance_number, :string, default: ""
  end
end
