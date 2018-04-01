class RemoveColumnFromParticipates < ActiveRecord::Migration[5.1]
  def change
    remove_column :participates, :participate_id, :integer
    remove_column :pendings, :uid, :string
    remove_column :pendings, :live_id, :integer
  end
end