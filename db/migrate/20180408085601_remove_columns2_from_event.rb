class RemoveColumns2FromEvent < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :live_date, :date
    remove_column :events, :live_start, :time
    remove_column :events, :live_email, :string
    remove_column :events, :uid, :string
    remove_column :events, :ip, :string
    remove_column :events, :user_id, :integer
  end
end
