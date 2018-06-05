class RemoveColumns3FromEvent < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :date, :date
    remove_column :events, :start, :time
  end
end
