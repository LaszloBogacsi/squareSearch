require 'net/http'

class ImageSearch

def getRequest(user_color, randomNoun)
  key = ENV["pixabay_api_key"]
  url = URI.parse("http://pixabay.com/api/?key=#{key}&q=#{user_color}+#{randNoun}&image_type=photo")
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
  end
  JSON.parse res.body
end


end
