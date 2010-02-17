class AddTitleToPaintColor < ActiveRecord::Migration
  def self.up
    add_column :paint_color_types, :title, :string
  end

  def self.down
    remove_column :paint_color_types, :title
  end
end