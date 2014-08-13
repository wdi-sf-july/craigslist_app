require "./scrapper"

describe "scrapper" do 

  before(:each) do
    # use @doc in your tests to avoid hitting the
    #   craigslist url, which would be slow and 
    #   problematic if you were blocked
    @doc = Nokogiri::HTML(open("today.html"))
    @today = "Aug 12"
  end

  describe "get_todays_rows" do
    it "should return an array" do
      rows = get_todays_rows(@doc, @today)
      expect(rows.instance_of?(Array)).to be(true)
    end

    it "should select row with a .row class today's date in .date" do
      html = "<div><div class='row'><div class='date'>#{@today}</div></div></div>"
      doc = Nokogiri::HTML(html)
      rows = get_todays_rows(doc, @today)
      expect(rows.length).to eql(1)
    end

  end

  describe "filter_links" do
    it "should return an array" do
      rows = @doc.css(".row")
      links = filter_links(rows, /puppy|pup|dog/i)
      expect(links.instance_of?(Array)).to be(true)
    end
    it "should return a match for a row with the word dog" do
      # rowsString is contains one valid row
      row_text = 'Dog!'
      rowsString =  '<div><p class="row" data-pid="4581207234"> <a href="/sfc/pet/4581207234.html" class="i" data-id="0:00F0F_kUje2CUzekG"></a> <span class="txt"> <span class="star"></span> <span class="pl"> <span class="date">Aug 12</span>  <a href="/sfc/pet/4581207234.html" data-id="4581207234" class="hdrlnk">' + row_text + '</a> </span> <span class="l2">   <span class="pnr"> <small> (Bay Area)</small> <span class="px"> <span class="p"> pic&nbsp;<span class="maptag" data-pid="4581207234">map</span></span></span> </span>  </span> </span> </p></div>'
      rows = Nokogiri::HTML(rowsString).css(".row")
      expect(filter_links(rows, /puppy|pup|dog/i).length).to eql(1)
    end

    it "should return a match for a row with the word puppy" do
      # rowsString is contains one valid row
      row_text = 'Puppy!'
      rowsString = '<div><p class="row" data-pid="4581207234"> <a href="/sfc/pet/4581207234.html" class="i" data-id="0:00F0F_kUje2CUzekG"></a> <span class="txt"> <span class="star"></span> <span class="pl"> <span class="date">Aug 12</span>  <a href="/sfc/pet/4581207234.html" data-id="4581207234" class="hdrlnk">' + row_text + '</a> </span> <span class="l2">   <span class="pnr"> <small> (Bay Area)</small> <span class="px"> <span class="p"> pic&nbsp;<span class="maptag" data-pid="4581207234">map</span></span></span> </span>  </span> </span> </p></div>'
      rows = Nokogiri::HTML(rowsString).css(".row")
      expect(filter_links(rows, /puppy|pup|dog/i).length).to eql(1)
    end

    it "should return a match for a row with the word pup" do
      # rowsString is contains one valid row
      row_text = 'Pup pup!'
      rowsString = '<div><p class="row" data-pid="4581207234"> <a href="/sfc/pet/4581207234.html" class="i" data-id="0:00F0F_kUje2CUzekG"></a> <span class="txt"> <span class="star"></span> <span class="pl"> <span class="date">Aug 12</span>  <a href="/sfc/pet/4581207234.html" data-id="4581207234" class="hdrlnk">' + row_text + '</a> </span> <span class="l2">   <span class="pnr"> <small> (Bay Area)</small> <span class="px"> <span class="p"> pic&nbsp;<span class="maptag" data-pid="4581207234">map</span></span></span> </span>  </span> </span> </p></div>'
      rows = Nokogiri::HTML(rowsString).css(".row")
      expect(filter_links(rows, /puppy|pup|dog/i).length).to eql(1)
    end

  end

end