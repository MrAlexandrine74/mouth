class ChangePostsToEntries < ActiveRecord::Migration
  def self.up
    rename_table  :posts, :entries
    add_column    :entries, :type, :string
  end

  def self.down
    remove_column :table_name, :column_name
    remove_column :entries, :type
  end
end
