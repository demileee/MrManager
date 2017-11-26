require 'net/http'
require 'uri'
require 'json'

class Slackbot

  def send_to_slackbot(message)
    uri = URI.parse("#{ENV["SLACKBOT_WEBHOOK"]}")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request.body = JSON.dump({
      "text" => message
    })

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
  end

end
