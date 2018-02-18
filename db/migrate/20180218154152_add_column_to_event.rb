class AddColumnToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :uid, :string
    add_column :events, :ip, :string
  end
end
