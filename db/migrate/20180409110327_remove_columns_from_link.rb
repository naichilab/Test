class RemoveColumnsFromLink < ActiveRecord::Migration[5.1]
  def change
    remove_column :links, :event_id, :integer
    remove_column :links, :link, :string
  end
end
