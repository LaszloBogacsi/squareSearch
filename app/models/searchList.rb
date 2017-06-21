class SearchList

  @@search_list = []

  def self.add (date_time, color, random_word, search_time)
    date = date_time.strftime('%d-%m-%Y')
    time = date_time.strftime('%I:%M:%S %p')
    @@search_list.insert(0, {date: date, time: time, color: color, noun: random_word, search_time: search_time})
  end

  def self.findAll
    @@search_list
  end

  def self.clean
   @@search_list = []
  end
end
