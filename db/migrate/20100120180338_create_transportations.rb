class CreateTransportations < ActiveRecord::Migration
  def self.up
    create_table :transportations do |t|
      t.integer :kebab_id
      t.integer :person_id

      t.timestamps
    end
  end

  def self.down
    drop_table :transportations
  end
end
