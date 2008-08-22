class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :entry_id
      t.string :entry_type
      t.integer :user_id
      t.string :name
      t.string :email
      t.string :website
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
