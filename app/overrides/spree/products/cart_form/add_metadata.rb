Deface::Override.new(
  virtual_path: 'spree/products/_cart_form',
  insert_after: "[data-hook='product_price'], #product_price[data-hook]",
  text: "<%= tag :div, id: 'product_metadata', 'data-permalink' => @product.permalink %>",
  name: "product_permalink")