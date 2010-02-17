class CreatePaintColor < ActiveRecord::Migration
  def self.up
    create_table :paint_colors,:force=>true do |t|
      t.integer :product_id
      t.integer :color_id
      t.integer :paint_color_type_id
      t.timestamps
    end
    add_index :paint_colors, :product_id
    add_index :paint_colors, :color_id
    add_index :paint_colors, [:product_id,:paint_color_type_id]

    create_table :paint_color_types,:force=>true do |t|
      t.string :identifier
      t.string :reference
      t.string :description
      t.timestamps
    end   
  end

  def self.down
    drop_table :paint_colors
    drop_table :paint_color_types
  end
end
