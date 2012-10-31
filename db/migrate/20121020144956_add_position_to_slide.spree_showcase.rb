# This migration comes from spree_showcase (originally 20120507074922)
class AddPositionToSlide < ActiveRecord::Migration
  def self.up
    add_column :spree_slides, :position, :integer
  end

  def self.down
    remove_column :spree_slides, :position
  end
end