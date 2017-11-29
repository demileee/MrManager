class Unsplash

  attr_reader :photographer
  attr_reader :portfolio_link
  attr_reader :image
  attr_reader :hex

  def initialize
    @cache = Rails.application.cache
    if @cache.read(:image) == nil
      response = HTTParty.get("https://api.unsplash.com/photos/random/?client_id=#{ENV["UNSPLASH_KEY"]}&query=nature&count=1")
      parsed_response = JSON.parse(response.body)
      @cache.write(:photographer, parsed_response[0]["user"]["name"])
      @cache.write(:portfolio_link, parsed_response[0]["user"]["links"]["html"])
      @cache.write(:image, parsed_response[0]["urls"]["full"])
      @cache.write(:hex, self.get_hex(parsed_response[0]["urls"]["small"]))
    end
    @image = @cache.read(:image)
    @portfolio_link = @cache.read(:portfolio_link)
    @photographer = @cache.read(:photographer)
    @hex = @cache.read(:hex)
  end

  def get_hex(image)
    original = Magick::Image.read(image).first
    quantized = original.quantize(1, Magick::RGBColorspace)
    hist = quantized.color_histogram
    sorted = hist.keys.sort_by {|p| -hist[p]}
    new_img = Magick::Image.new(hist.size, 1)
    normal = new_img.store_pixels(0, 0, hist.size, 1, sorted)
    palette = Magick::ImageList.new
    pixels = normal.get_pixels(0, 0, normal.columns, 1)
    hex =  pixels.first.to_color(Magick::AllCompliance, false, 8, true)
  end

end
