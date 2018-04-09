class RemoveColumns2FromPending < ActiveRecord::Migration[5.1]
  def change
    remove_column :pendings, :event_id, :integer
    remove_column :pendings, :user_id, :integer
  end
end
