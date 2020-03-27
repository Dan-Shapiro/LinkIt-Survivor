class CreateTribeVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :tribe_votes do |t|
      t.references :tribe, foreign_key: true
      t.references :vote, foreign_key: true

      t.timestamps
    end
  end
end
