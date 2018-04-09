class RemoveColumn2FromPerformer < ActiveRecord::Migration[5.1]
  def change
    remove_column :performers, :event_id, :integer
    remove_column :performers, :user_id, :integer
  end
end
