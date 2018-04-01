class RemoveColumnFromPendings < ActiveRecord::Migration[5.1]
  def change
    remove_column :pendings, :pending_id, :integer
    remove_column :pendings, :uid, :string
    remove_column :pendings, :live_id, :integer
  end
end
