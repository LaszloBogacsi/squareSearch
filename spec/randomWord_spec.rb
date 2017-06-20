require './app/models/randomWord.rb'

RSpec.describe RandomWord do
  it "#getNoun can get a random word from an array of words" do
  nouns = ["man", "mountain", "state", "ocean", "country", "building", "cat", "airline", "wealth", "happiness", "pride", "fear", "religion", "bird", "book", "phone", "rice", "snow", "water"]
  expect(nouns).to include RandomWord.getNoun
  end
end
