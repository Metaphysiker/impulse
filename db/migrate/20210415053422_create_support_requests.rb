class CreateSupportRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :support_requests do |t|
      t.string :title, default: ""
      t.text :content, default: ""

      t.timestamps
    end
  end
end
