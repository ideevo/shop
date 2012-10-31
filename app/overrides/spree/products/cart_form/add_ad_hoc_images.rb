Deface::Override.new(
  virtual_path: 'spree/products/_cart_form',
  name: 'add_ad_hoc_images',
  insert_after: "[data-hook='product_price'], #product_price[data-hook]",
  partial: 'spree/products/imaging')
