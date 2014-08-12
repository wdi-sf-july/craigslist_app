require "./scrapper"

describe "scrapper" do 

  before(:each) do
    @doc = Nokogiri::HTML(open("today.html"))
    @today = "Aug 12"
  end

  describe "filter_links" do
    it "should here is an example of using the befor each data" do
      rows = @doc.css(".row")
      rows.each do |row|
        puts row.content
      end
      expect("your attention").to eql("this test to be erased or edited")
    end
  end

  describe "get_todays_rows" do
  end
end