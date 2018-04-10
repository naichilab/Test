class CreateEventPerformers < ActiveRecord::Migration[5.1]
  def change
    create_table :event_performers do |t|
      t.references :event, foreign_key: true
      t.string :performer

      t.timestamps
    end
  end
end
