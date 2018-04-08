class AddColumnsToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :date, :string
    add_column :events, :start, :string
    add_column :events, :tel, :string
    add_column :events, :email, :string
    add_column :events, :title, :string
    add_column :events, :description, :string
  end
end
