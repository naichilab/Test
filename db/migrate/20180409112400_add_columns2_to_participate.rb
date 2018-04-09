class AddColumns2ToParticipate < ActiveRecord::Migration[5.1]
  def change
    add_reference :participates, :event, foreign_key: true
    add_reference :participates, :user, foreign_key: true
  end
end
