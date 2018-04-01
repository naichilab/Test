class AddColumnsToPendings < ActiveRecord::Migration[5.1]
  def change
    add_column :pendings, :user_id, :integer
    add_column :pendings, :event_id, :integer
  end
end
