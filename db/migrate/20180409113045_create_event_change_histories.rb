class CreateEventChangeHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :event_change_histories do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.string :user_ip, null: false

      t.timestamps
    end
  end
end
