class CreateParticipations < ActiveRecord::Migration
  def self.up
    create_table :participations, :id => false do |t|
      t.integer :kebab_id
      t.integer :person_id

      t.timestamps
    end
  end

  def self.down
    drop_table :participations
  end
end
