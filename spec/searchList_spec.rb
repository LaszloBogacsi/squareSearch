require './app/models/searchList'
RSpec.describe SearchList do

  it "has an empty class array variable on app init" do
    expect(SearchList.findAll).to eq []
  end

  it "can add a new search item to the list" do
    SearchList.add(Time.new, "yellow", "car", 173)
    expect(SearchList.findAll.length).to eq 1
  end

  it "contains the data in an array of hashes" do
    SearchList.add(Time.new, "yellow", "car", 173)
    expect(SearchList.findAll.first[:color]).to eq "yellow"
    expect(SearchList.findAll.first[:noun]).to eq "car"
    expect(SearchList.findAll.first[:search_time]).to eq 173
  end

  it "formats the Time as a date" do
    time = Time.new
    date = time.strftime('%d-%m-%Y')
    SearchList.add(time, "yellow", "car", 173)
    expect(SearchList.findAll.first[:date]).to eq date
  end

  it "formats the Time as a time" do
    time = Time.new
    time_format = time.strftime('%I:%M:%S %p')
    SearchList.add(time, "yellow", "car", 173)
    expect(SearchList.findAll.first[:time]).to eq time_format
  end

  it "the list is sorted by most recent is the first element" do
    SearchList.add(Time.new, "yellow", "car", 173)
    SearchList.add(Time.new, "red", "water", 366)
    expect(SearchList.findAll.first[:color]).to eq "red"
    expect(SearchList.findAll.first[:noun]).to eq "water"
    expect(SearchList.findAll.first[:search_time]).to eq 366
  end
end
