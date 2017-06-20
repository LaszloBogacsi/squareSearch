require './app/models/imageSearch'
require './app/models/randomWord'
class IndexController < ApplicationController
  def index
    @colors = Colors.findAll
  end

  def show
    imageSearch = ImageSearch.new
    @images = imageSearch.getRequest("yellow",RandomWord.getNoun)["hits"]
  end
end
