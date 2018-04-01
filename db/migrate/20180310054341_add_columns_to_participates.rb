class AddColumnsToParticipates < ActiveRecord::Migration[5.1]
  def change
    add_column :participates, :user_id, :integer
    add_column :participates, :event_id, :integer
  end
end
