class AddPeriodToParticipants < ActiveRecord::Migration[6.0]
  def change
    add_column :participants, :period_start, :date
    add_column :participants, :period_end, :date
    change_column_default :participants, :status, "active"
  end
end
