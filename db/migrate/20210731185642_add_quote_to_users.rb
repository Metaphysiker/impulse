class AddQuoteToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :quote, :string, default: ""
  end
end
