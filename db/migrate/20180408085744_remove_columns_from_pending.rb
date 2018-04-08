class RemoveColumnsFromPending < ActiveRecord::Migration[5.1]
  def change
    remove_column :pendings, :live_id, :integer
    remove_column :pendings, :uid, :string
  end
end
