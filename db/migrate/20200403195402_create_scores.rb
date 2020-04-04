class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true
      t.decimal :score
      t.boolean :active

      t.timestamps
    end
  end
end
