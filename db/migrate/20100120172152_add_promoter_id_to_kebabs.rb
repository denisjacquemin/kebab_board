class AddPromoterIdToKebabs < ActiveRecord::Migration
  def self.up
    add_column :kebabs, :promoter_id, :integer
  end

  def self.down
    remove_column :kebabs, :promoter_id
  end
end
