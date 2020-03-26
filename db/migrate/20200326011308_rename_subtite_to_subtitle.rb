class RenameSubtiteToSubtitle < ActiveRecord::Migration[5.2]
  def change
  	rename_column :posts, :subtite, :subtitle
  end
end
