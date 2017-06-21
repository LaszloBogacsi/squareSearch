require './app/models/imageSearch.rb'
require 'webmock/rspec'
require 'json'
require 'net/http'
RSpec.describe ImageSearch do
  before(:each) do
  stub_request(:get, /pixabay.com\/api/).with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).to_return(status: 200, body: "{}", headers: {})
end

  it "#getRequest performs an http get request and returns an empty JSON" do
    imageSearch = ImageSearch.new
    expect(imageSearch.getRequest("yellow", "cat")).to be { }
  end

  it "#get_time returns 0 if no getRequest performed" do
    imageSearch = ImageSearch.new
    expect(imageSearch.get_time).to eq 0
  end

  it "#getTime returns the time needed to return the response" do
    imageSearch = ImageSearch.new
    imageSearch.getRequest("yellow", "cat")
    expect(imageSearch.get_time).not_to eq 0
  end

end
