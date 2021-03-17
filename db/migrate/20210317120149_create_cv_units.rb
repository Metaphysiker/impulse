class CreateCvUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :cv_units do |t|
      t.string :category, default: ""
      t.string :name, default: ""
      t.text :content, default: ""
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
