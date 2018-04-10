class CreateEventCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :event_categories do |t|
      t.references :event, foreign_key: true
      t.string :category

      t.timestamps
    end
  end
end
