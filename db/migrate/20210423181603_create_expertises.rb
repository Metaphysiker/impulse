class CreateExpertises < ActiveRecord::Migration[6.0]
  def change
    create_table :expertises do |t|
      t.string :title, default: ""
      t.text :description, default: ""
      t.text :content, default: ""

      t.timestamps
    end
  end
end
