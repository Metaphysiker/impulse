class AddInfoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :location, :string, default: ""
    add_column :users, :plz, :string, default: ""
    add_column :users, :street, :string, default: ""
    add_column :users, :phone, :string, default: ""
    add_column :users, :birth_day, :date
    add_column :users, :recruitment_consultant, :string, default: ""
    add_column :users, :disposal_period_start, :date
    add_column :users, :disposal_period_end, :date
  end
end
