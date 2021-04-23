class CreateManyToManyRelationshipBetweenSupportRequestAndExpertise < ActiveRecord::Migration[6.0]
  def change
    create_table :support_request_expertises do |t|
      t.belongs_to :support_request
      t.belongs_to :expertise
      t.timestamps
    end
  end
end
