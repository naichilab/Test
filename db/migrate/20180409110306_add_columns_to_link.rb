class AddColumnsToLink < ActiveRecord::Migration[5.1]
  def change
    add_reference :links, :event, foreign_key: true
    add_column :links, :url, :string
  end
end
