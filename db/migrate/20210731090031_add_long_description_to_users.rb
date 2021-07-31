class AddLongDescriptionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :long_description, :text, default: ""
    add_column :users, :power_word1, :string, default: ""
    add_column :users, :power_word2, :string, default: ""
    add_column :users, :power_word3, :string, default: ""
  end
end
