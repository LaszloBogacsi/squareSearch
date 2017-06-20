class RandomWord
    @@nouns = ["man", "mountain", "state", "ocean", "country", "building", "cat", "airline", "wealth", "happiness", "pride", "fear", "religion", "bird", "book", "phone", "rice", "snow", "water"]

  def self.getNoun
    @@nouns.sample
  end

end
