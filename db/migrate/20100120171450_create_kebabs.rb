class CreateKebabs < ActiveRecord::Migration
  def self.up
    create_table :kebabs do |t|
      t.date :date
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :kebabs
  end
end
