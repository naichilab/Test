class RemoveColumnFromParticipate < ActiveRecord::Migration[5.1]
  def change
    remove_column :participates, :user_num, :integer
  end
end
