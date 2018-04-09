class RemoveColumnsFromCategory < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :event_id, :integer
  end
end
