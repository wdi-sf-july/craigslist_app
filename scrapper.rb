# scrapper.rb
require 'nokogiri'
require 'open-uri'


def filter_links(rows, regex)
  # takes in rows and returns uses
  # regex to only return links 
  # that have "pup", "puppy", or "dog"
  # keywords
  matched_rows = []
  rows.each do |row|
    link = row.css(".hdrlnk")
    matches = row.text.match(regex)
    if matches
      match = {}
      match["link"] = link.attribute("href").text
      match["text"] = link.text
      matched_rows.push match
    end
  end
  matched_rows
end

def get_todays_rows(doc, date_str)
  #  1.) open chrome console to look in inside p.row to see
  #  if there is some internal date related content

  #  2.) figure out the class that you'll need to select the
  #   date from a row
  rows = doc.css(".row")
  todays_rows = []
  rows.each do |row|
    dateText = row.css(".date").text
    matches = dateText.match(date_str)
    todays_rows.push(row) if matches
  end
  todays_rows
end

def get_page_results
  url = "http://sfbay.craigslist.org/sfc/pet/"
  Nokogiri::HTML(open(url))
end

def search(date_str)
  regex = /puppy|pup|dog/i
  # Grab the page
  doc = get_page_results
  # Grab the rows
  rows = get_todays_rows(doc, date_str)
  # Grab the links
  links = filter_links(rows, regex)
  puts links.join("\n#{'*'*50}\n")
  links
end

# want to learn more about 
# Time in ruby??
#   http://www.ruby-doc.org/stdlib-1.9.3/libdoc/date/rdoc/Date.html#strftime-method
today = Time.now.strftime("%b %d")
puts today
#search("Aug 13")