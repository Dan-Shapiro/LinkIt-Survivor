class RemoveContentFromInfoPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :info_posts, :content, :text
  end
end
