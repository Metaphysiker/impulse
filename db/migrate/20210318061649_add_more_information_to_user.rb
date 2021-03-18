class AddMoreInformationToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :job_title, :string, default: ""
    add_column :users, :website, :string, default: ""
    add_column :users, :short_description, :text, default: ""
  end
end
