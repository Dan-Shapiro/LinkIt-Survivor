class AddFlagToTribe < ActiveRecord::Migration[5.2]
  def change
    add_column :tribes, :flag_filename, :string
  end
end
