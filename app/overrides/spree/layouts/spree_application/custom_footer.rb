#Deface::Override.new virtual_path: "spree/layouts/spree_application",
#                     name: "custom_footer",
#                     insert_bottom: "body[data-hook]",
#                     partial: "spree/layouts/spree_application/footer"

Deface::Override.new(
  virtual_path: "spree/layouts/spree_application",
  name: "custom_footer",
  insert_bottom: "body[data-hook]",
  text: '<div style="clear:both"></div><br><br>')
  #partial: "spree/layouts/spree_application/footer")
