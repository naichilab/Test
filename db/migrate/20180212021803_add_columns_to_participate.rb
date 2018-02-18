class AddColumnsToParticipate < ActiveRecord::Migration[5.1]
  def change
    add_column :participates, :participate_id, :integer
    add_column :participates, :user_num, :integer
    add_column :participates, :live_id, :integer
  end
end
