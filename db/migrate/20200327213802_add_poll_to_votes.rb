class AddPollToVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :poll, :boolean
  end
end
