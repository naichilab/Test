class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :live_id
      t.date :live_date
      t.time :live_start
      t.string :live_name
      t.string :live_remarks
      t.string :link_1
      t.string :link_2
      t.string :link_3
      t.string :link_4
      t.string :live_email

      t.timestamps
    end
  end
end
