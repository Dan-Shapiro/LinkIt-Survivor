class AddDisplayNameToTribes < ActiveRecord::Migration[5.2]
  def change
    add_column :tribes, :display_name, :string
  end
end
