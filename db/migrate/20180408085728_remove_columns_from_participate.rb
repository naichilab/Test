class RemoveColumnsFromParticipate < ActiveRecord::Migration[5.1]
  def change
    remove_column :participates, :live_id, :integer
    remove_column :participates, :uid, :string
  end
end
