class RemoveColumnsFromEvent < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :live_name, :string
    remove_column :events, :live_remarks, :string
    remove_column :events, :link_1, :string
    remove_column :events, :link_2, :string
    remove_column :events, :link_3, :string
    remove_column :events, :link_4, :string
  end
end
