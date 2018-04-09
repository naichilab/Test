class AddColumnsToLink < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :event, :reference, foreign_key: true
    add_column :links, :url, :string
  end
end
