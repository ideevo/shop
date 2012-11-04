require 'RMagick'

class Ideevo::CustomImage

  def initialize(options={})
    @product_name = options[:product_name]
    @image_name = options[:image_name]
    @size = options[:size]
    @desired_attributes = options[:attributes]
  end

  def path
    export unless File.exists?(export_path)
    export_path
  end

  private

  def export_path
    self.class.exports_path.join(filename)
  end

  def filename
    [@product_name, @image_name, "#{width}x#{height}", serialized_attributes].compact.join('_') + '.png'
  end

  private

  def serialized_attributes
    result = {}
    attributes.each do |attribute, value|
      result[attribute] = value[:name]
    end
    result.to_a.sort_by(&:first).flatten.join('_')
  end

  def export
    image.write(export_path)
  end

  def image
    @image ||= begin
      Rails.logger.info "Generating #{@product_name.inspect} #{@image_name.inspect} #{attributes.inspect}..."
      list =  Magick::ImageList.new(base_image_path)
      attributes.values.each do |value|
        Rails.logger.info "Enqueing #{value}..."
        list << value[:image]
      end
      Rails.logger.info "Merging..."
      result = list.flatten_images
      if valid_size?
        Rails.logger.info "Resizing to #{magick_size.inspect}..."
        result.resize_to_fit!(magick_size.first, magick_size.last)
      else
        Rails.logger.info "Done..."
      end
      result
    end
  end

  def attributes
    @attributes ||= begin
      result = {}
      @desired_attributes.each do |attribute, value|
        value_path = attributes_path.join(attribute, "#{value}.png")
        next unless File.exists?(value_path)
        result[attribute] = { name: value, image: Magick::Image.read(value_path).first }
      end
      result
    end
  end

  def magick_size
    return [100, 100] unless valid_size?
    styles[@size.to_s].split('>').first.split('x').map(&:to_i)
  end

  def width
    magick_size.first
  end

  def height
    magick_size.last
  end

  def styles
    ActiveSupport::JSON.decode(Spree::Config[:attachment_styles])
  end

  def valid_size?
    styles.include?(@size)
  end

  def base_image_path
    self.class.generator_path.join(@product_name, "#{@image_name}.png")
  end

  def attributes_path
    self.class.generator_path.join(@product_name, @image_name)
  end

  def self.generator_path
    Rails.root.join('../heroes')
  end

  def self.exports_path
    Rails.root.join('private/exports')
  end

end
