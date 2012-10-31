# This migration comes from spree_master_price (originally 20120410214509)
class AddMasterPriceToVariant < ActiveRecord::Migration
  def change
    add_column :spree_variants, :use_master_price, :boolean, :default => false
  end
end
