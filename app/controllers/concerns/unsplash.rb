class Unsplash

  def self.get_background
    response = HTTParty.get("https://api.unsplash.com/photos/random/?client_id=#{ENV["UNSPLASH_KEY"]}&query=nature&count=1")
    parsed_response = JSON.parse(response.body)
    parsed_response[0]["urls"]["full"]
  end

end
