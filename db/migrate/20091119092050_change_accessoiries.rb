class ChangeAccessoiries < ActiveRecord::Migration
  def self.up
    add_column :accessories, :linkable_type, :string,:limit=>50
    add_column :accessories, :linkable_id, :integer
    remove_column :accessories, :accessory_product_id
    execute "ALTER TABLE `accessories`
                  ADD COLUMN `id` INT(11) AUTO_INCREMENT NOT NULL FIRST,
                  ADD PRIMARY KEY(`id`)"
  end

  def self.down
    remove_column :accessories, :linkable_type, :linkable_id
  end
end
