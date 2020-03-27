class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.string :title
      t.text :content
      t.boolean :active
      t.references :tribe, foreign_key: true

      t.timestamps
    end
  end
end
