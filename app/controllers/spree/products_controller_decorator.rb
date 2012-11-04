Spree::ProductsController.class_eval do

  def image
    return unless valid?
    options = { product_name: @product.permalink, image_name: params[:image_id], size: params[:size], attributes: attributes }
    image = Ideevo::CustomImage.new(options)
    path = image.path
    # TODO Send through Nginx
    #head :x_accel_redirect => path, :content_type => 'image/png' #, :content_disposition => 'inline'
    send_file path, :type => 'image/png', :disposition => 'inline'
  end

  private

  def valid?
    valid_product? and valid_attributes?
  end

  def valid_product?
    @product = Spree::Product.active.find_by_permalink(params[:id])
  end

  def valid_attributes?
    params[:attributes].is_a?(Hash)
  end

  def attributes
    result = {}
    return result unless valid_attributes?
    params[:attributes].each do |attribute, value|
      if ad_hoc_option_type = Spree::AdHocOptionType.find_by_id(attribute)
        if ad_hoc_option_value = ad_hoc_option_type.ad_hoc_option_values.find_by_id(value)
          result[ad_hoc_option_type.name] = ad_hoc_option_value.option_value.name
        end
      end
    end
    result
  end

end


