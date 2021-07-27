class AddInformationToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nationality, :string, default: ""
    add_column :users, :marital_status, :string, default: ""
  end
end
