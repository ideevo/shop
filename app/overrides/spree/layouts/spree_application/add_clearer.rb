Deface::Override.new(
  virtual_path: "spree/layouts/spree_application",
  name: "add_clearer",
  insert_bottom: "body[data-hook]",
  text: '<div style="clear:both"></div><br><br>')
