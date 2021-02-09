class AddInfoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :location, :string
    add_column :users, :plz, :string
    add_column :users, :street, :string
    add_column :users, :phone, :string
    add_column :users, :birth_day, :date
    add_column :users, :recruitment_consultant, :string
    add_column :users, :disposal_period_start, :date
    add_column :users, :disposal_period_end, :date
  end
end
