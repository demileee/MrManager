class Unsplash

  attr_reader :photographer
  attr_reader :portfolio_link
  attr_reader :image

# First try to read from cache store

# If empty, call API and write to cache store

  def initialize
    # expires_in 24.hours
    response = HTTParty.get("https://api.unsplash.com/photos/random/?client_id=#{ENV["UNSPLASH_KEY"]}&query=nature&count=1")
    parsed_response = JSON.parse(response.body)
    @portfolio_link = parsed_response[0]["user"]["links"]["html"]
    @photographer = parsed_response[0]["user"]["name"]
    @image  = parsed_response[0]["urls"]["full"]
  end

end




# def self.get_background
#   response = HTTParty.get("https://api.unsplash.com/photos/random/?client_id=#{ENV["UNSPLASH_KEY"]}&query=nature&count=1")
#   parsed_response = JSON.parse(response.body)
#   portfolio_link = parsed_response[0]["portfolio"]
#   photographer = parsed_response[0]["user"]["name"]
#   parsed_response[0]["urls"]["full"]
# end
