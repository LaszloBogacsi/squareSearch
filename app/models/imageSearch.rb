require 'net/http'

class ImageSearch

def getRequest
  key = ENV["pixabay_api_key"]
  color = "yellow"
  randNoun = "flower"

  url = URI.parse("http://pixabay.com/api/?key=#{key}&q=#{color}+#{randNoun}&image_type=photo")
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
  # res.body
  JSON.parse res.body
end


end
