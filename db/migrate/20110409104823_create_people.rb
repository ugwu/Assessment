class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :name
      t.string :surname
      t.integer :age
      t.text :gender
      t.integer :income
      t.string :email
      t.string :postcode
      t.string :msisdn

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
