class AddActiveToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :active, :boolean
  end
end
