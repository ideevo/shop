module Spree
  Address.class_eval do

    # Make phone number optional
    _validators.reject!{ |key, value| key == :phone }
    _validate_callbacks.each do |callback|
      callback.raw_filter.attributes.reject! { |key| key == :phone } if callback.raw_filter.respond_to?(:attributes)
    end

    #private
    #
    ## Make state for Germany optional
    #alias_method :original_state_validate, :state_validate
    #def state_validate
    #  if country.present? && country.iso == 'DE'
    #    state_name = '-'
    #    return true
    #  end
    #  original_state_validate
    #end

  end
end