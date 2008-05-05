class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :permalink
      t.string :title
      t.text :excerpt
      t.text :body
      t.integer :status
      t.datetime :published_at
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
