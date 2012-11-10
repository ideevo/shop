#Deface::Override.new(
#  virtual_path: "spree/checkout/_summary",
#  name: "order_summary_tables",
#  cut: %{[data-hook='order_details_price_adjustments']},
#  insert_before: %{#summary-order-charges[data-hook]})
