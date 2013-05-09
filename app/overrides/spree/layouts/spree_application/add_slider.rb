Deface::Override.new(
  virtual_path: "spree/layouts/spree_application",
  name: "add_slider",
  insert_after: "#top-nav-bar",
  partial: "spree/shared/slider")
