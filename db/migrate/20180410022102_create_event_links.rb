class CreateEventLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :event_links do |t|
      t.references :event
      t.string :url

      t.timestamps
    end
  end
end
