class RemoveColumns2FromParticipate < ActiveRecord::Migration[5.1]
  def change
    remove_column :participates, :event_id, :integer
    remove_column :participates, :user_id, :integer
  end
end
