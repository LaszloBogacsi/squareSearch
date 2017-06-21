require './app/models/imageSearch'
require './app/models/randomWord'
require './app/models/searchList'

class SearchController < ApplicationController
  def index
    @colors = Colors.findAll
    @search_list = SearchList.findAll
  end

  def show
    imageSearch = ImageSearch.new
    @color = params[:id]
    params[:format] ?  @randomWord = params[:format] : @randomWord = RandomWord.getNoun
    @images = imageSearch.getRequest(@color, @randomWord)["hits"]
    SearchList.add(Time.new, @color, @randomWord, imageSearch.get_time)
  end
end
