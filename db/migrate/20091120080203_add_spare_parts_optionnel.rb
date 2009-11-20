class AddSparePartsOptionnel < ActiveRecord::Migration
  def self.up
    create_table :optional_spare_parts do |t|
      t.references :product
      t.column :osp_type,  :string,:limit=>50, :null => false
      t.column :osp_id, :integer, :null => false
    end
    rename_table :accessories, :spare_parts
    rename_column :spare_parts, :linkable_type, :sp_type
    rename_column :spare_parts, :linkable_id, :sp_id
  end

  def self.down
    drop_table :optional_spare_parts
  end
end
