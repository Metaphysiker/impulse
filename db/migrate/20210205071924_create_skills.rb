class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :title, default: ""
      t.string :category, default: ""

      t.timestamps
    end
  end
end
