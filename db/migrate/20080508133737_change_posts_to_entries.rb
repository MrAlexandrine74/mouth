class ChangePostsToEntries < ActiveRecord::Migration
  def self.up
    rename_table  :posts, :entries
    add_column    :entries, :type, :string
  end

  def self.down
    remove_column :entries, :posts
    remove_column :posts, :type
  end
end
