# This migration comes from spree_slider (originally 20120816192758)
class AddPositionToSlides < ActiveRecord::Migration
  def change
    drop_table :spree_slides
    create_table :spree_slides do |t|
      t.string :name
      t.text :body
      t.string :link_url
      t.boolean :published
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.integer :position, null: false, default: 0
      t.integer :product_id
      t.timestamps
    end
  end
end
