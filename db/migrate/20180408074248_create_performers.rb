class CreatePerformers < ActiveRecord::Migration[5.1]
  def change
    create_table :performers do |t|
      t.integer :event_id
      t.string :performer

      t.timestamps
    end
  end
end
