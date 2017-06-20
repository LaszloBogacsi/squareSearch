require './app/models/colors.rb'

RSpec.describe Colors do
  it "#findAll can get all the predifined colors" do
  colors = ["red", "pink", "orange", "yellow", "green", "blue", "purple"]
  expect(colors).to eq Colors.findAll
  end
end
