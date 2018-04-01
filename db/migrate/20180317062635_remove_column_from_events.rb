class RemoveColumnFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :live_id, :integer
  end
end
