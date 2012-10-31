Deface::Override.new(
  virtual_path: "spree/checkout/_address",
  name: "optional_address_attributes",
  insert_after: '#billing[data-hook]',
  partial: 'spree/checkout/optional_address_attributes')

Deface::Override.new(
  virtual_path: "spree/checkout/_address",
  name: "remove_required_asterisk",
  remove: '#billing[data-hook] #bstate span.required, #shipping[data-hook] #sstate span.required, #billing[data-hook] #bphone span.required, #shipping[data-hook] #sphone span.required')

