class CreateManyToManyRelationshipBetweenSupportRequestAndUser < ActiveRecord::Migration[6.0]
  def change
    create_table :support_request_users do |t|
      t.belongs_to :support_request
      t.belongs_to :user
      t.timestamps
    end
  end
end
