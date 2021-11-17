class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :motivation_letter_why_you, :text, default: ""
    add_column :users, :motivation_letter_why_me, :text, default: ""
    add_column :users, :motivation_letter_why_us, :text, default: ""
  end
end
