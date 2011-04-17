class CreateBugs < ActiveRecord::Migration
  def self.up
    create_table :bugs do |t|
      t.string :title
      t.string :priority
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :bugs
  end
end
