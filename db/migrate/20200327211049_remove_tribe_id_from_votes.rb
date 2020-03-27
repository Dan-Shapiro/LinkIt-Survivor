class RemoveTribeIdFromVotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :votes, :tribe_id, :int
  end
end
