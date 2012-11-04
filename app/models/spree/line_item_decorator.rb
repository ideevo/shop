module Spree
  LineItem.class_eval do

    def attributes
      result = {}
      ad_hoc_option_values.each do |ad_hoc_option_value|
        ad_hoc_option_type = ad_hoc_option_value.ad_hoc_option_type
        result[ad_hoc_option_type.id] = ad_hoc_option_value.id
      end
      result
    end

  end
end