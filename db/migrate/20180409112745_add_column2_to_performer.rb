class AddColumn2ToPerformer < ActiveRecord::Migration[5.1]
  def change
    add_reference :performers, :event, foreign_key: true
  end
end
