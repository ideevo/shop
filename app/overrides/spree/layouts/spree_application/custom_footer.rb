Deface::Override.new(
  virtual_path: "spree/layouts/spree_application",
  name: "custom_footer",
  insert_top: '#footer[data-hook]',
  partial: "spree/layouts/spree_application/footer")
