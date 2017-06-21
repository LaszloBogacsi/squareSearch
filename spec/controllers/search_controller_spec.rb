require 'rails_helper'
require './app/controllers/search_controller'

RSpec.describe SearchController, type: :controller do

  describe "GET #index" do
    it "renders the :index view" do
      get :index
      assert_response :success

    end

    it "populates an array of all colors" do
      get :index
      assert_equal(Colors.findAll ,assigns(:colors))
    end

    it "populates an array of recently searchet items if any" do
      get :index
      assert_equal(SearchList.findAll ,assigns(:search_list))
    end

  end

  describe "GET #show" do
    before(:each) do
      key = Figaro.env.pixabay_api_key
      stub_request(:get, "http://pixabay.com/api/?image_type=photo&key=#{key}&q=yellow%20bird")
      .with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'})
      .to_return(status: 200, body: "{}", headers: {})
    end
    it "renders the :show view" do
      get :show, params: { id: "yellow" , format:"bird"}
      assert_response :success
    end

    it "gets a random word" do
      randomWord = "bird"
      get :show, params: { id: "yellow", format: randomWord}
      assert_equal(randomWord ,assigns(:randomWord))
    end

    it "populates a variable with the results of the color param" do
      get :show, params: { id: "yellow", format: "bird"}
      assert_equal("yellow" ,assigns(:color))
    end

    it "adds the recent search to the search list" do
        allow(SearchList).to receive(:add)
        get :show, params: { id: "yellow", format: "bird"}
        expect(SearchList).to have_received(:add)
    end
    after(:each) do
      SearchList.clean
    end
  end

end
