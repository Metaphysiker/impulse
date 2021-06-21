class CreateCvs < ActiveRecord::Migration[6.0]
  def change
    create_table :cvs do |t|
      t.string :name, default: ""

      t.timestamps
    end

    create_table :user_cvs do |t|
      t.belongs_to :user
      t.belongs_to :cv
      t.timestamps
    end
  end
end
