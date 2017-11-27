class Unsplash

  attr_reader :photographer
  attr_reader :portfolio_link
  attr_reader :image
  # attr_reader :cache
# First try to read from cache store

# If empty, call API and write to cache store

  def initialize
    @cache = Rails.application.cache
    if @cache.read(:image) == nil
      response = HTTParty.get("https://api.unsplash.com/photos/random/?client_id=#{ENV["UNSPLASH_KEY"]}&query=nature&count=1")
      parsed_response = JSON.parse(response.body)
      @cache.write(:photographer, parsed_response[0]["user"]["name"])
      @cache.write(:portfolio_link, parsed_response[0]["user"]["links"]["html"])
      @cache.write(:image, parsed_response[0]["urls"]["full"])
    end
    @image = @cache.read(:image)
    @portfolio_link = @cache.read(:portfolio_link)
    @photographer = @cache.read(:photographer)
  end

end
