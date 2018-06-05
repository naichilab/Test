class AddColumn2ToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :datetime, :datetime
  end
end
