class RemoveActiveFromScores < ActiveRecord::Migration[5.2]
  def change
    remove_column :scores, :active, :boolean
  end
end
