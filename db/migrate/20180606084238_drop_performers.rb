class DropPerformers < ActiveRecord::Migration[5.1]
  def change
	 drop_table :performers
  end
end
