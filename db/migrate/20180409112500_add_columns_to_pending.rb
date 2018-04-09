class AddColumnsToPending < ActiveRecord::Migration[5.1]
  def change
    add_reference :pendings, :event, foreign_key: true
    add_reference :pendings, :user, foreign_key: true
  end
end
