class CreateConfessionals < ActiveRecord::Migration[5.2]
  def change
    create_table :confessionals do |t|
      t.references :user, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
