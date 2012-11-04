Deface::Override.new(
  :virtual_path => "spree/orders/_line_item",
  :name => "custom_image_on_inline_items",
  :replace => "[data-hook='cart_item_image']",
  :partial => "spree/orders/custom_cart_item_image")
