class CreatePreferences < ActiveRecord::Migration
  def self.up
    create_table :preferences do |t|
      t.column :name,            :string
      t.column :value,           :text
    end
  end

  def self.down
    drop_table :preferences
  end
end
