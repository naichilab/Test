class AddColumnToParticipate < ActiveRecord::Migration[5.1]
  def change
    add_column :participates, :uid, :string
  end
end
