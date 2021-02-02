class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.string :first_name, default: ""
      t.string :last_name, default: ""
      t.string :email, default: ""
      t.string :status, default: ""

      t.timestamps
    end
  end
end
