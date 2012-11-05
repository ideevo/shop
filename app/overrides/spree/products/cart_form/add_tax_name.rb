Deface::Override.new(
  virtual_path: 'spree/products/_cart_form',
  name: "add_tax_name",
  insert_bottom: "[data-hook='product_price'] #product-price",
  text: "<span class='tax_name'><%=t 'spree.including_tax' %></span>")