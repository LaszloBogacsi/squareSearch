require './app/models/imageSearch'
class IndexController < ApplicationController
  def index
    imageSearch = ImageSearch.new
    @images = imageSearch.getRequest["hits"]
  end
end
