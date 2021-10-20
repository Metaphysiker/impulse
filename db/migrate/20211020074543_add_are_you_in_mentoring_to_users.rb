class AddAreYouInMentoringToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :are_you_in_mentoring50, :string, default: "no"
  end
end
