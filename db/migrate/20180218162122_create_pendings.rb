class CreatePendings < ActiveRecord::Migration[5.1]
  def change
    create_table :pendings do |t|
      t.integer :pending_id
      t.string :uid
      t.integer :live_id
      t.timestamps
    end
  end
end
