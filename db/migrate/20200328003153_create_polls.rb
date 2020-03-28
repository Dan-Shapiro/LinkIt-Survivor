class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.references :vote, foreign_key: true
      t.references :user, foreign_key: true
      t.string :vote_for

      t.timestamps
    end
  end
end
