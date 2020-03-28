class AddTribeToVotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :votes, :tribe, foreign_key: true
  end
end
