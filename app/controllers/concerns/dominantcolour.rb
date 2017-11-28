class DomColour
  def get_pix(image)

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
