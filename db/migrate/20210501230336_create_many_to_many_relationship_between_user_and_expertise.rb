class CreateManyToManyRelationshipBetweenUserAndExpertise < ActiveRecord::Migration[6.0]
  def change
    create_table :user_expertises do |t|
      t.belongs_to :user
      t.belongs_to :expertise
      t.timestamps
    end
  end
end
