require 'net/http'

class ImageSearch
  def initialize
    @start = 0
    @finish = 0
  end

def getRequest(user_color, randomNoun)
  @start = Time.new
  key = ENV["pixabay_api_key"]
  url = URI.parse("http://pixabay.com/api/?key=#{key}&q=#{user_color}+#{randomNoun}&image_type=photo")
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
  end
  @finish = Time.new
  JSON.parse res.body
end

def get_time
  @finish - @start
end


end
