class AddColumnsToCategory < ActiveRecord::Migration[5.1]
  def change
    add_reference :categories, :event, foreign_key: true
  end
end
