## Nokogiri, regex and rspec lab with Craigslist

Your task for tonight is to write a __Puppy Scraper__. Your scraper will search craigslist for all [pets](http://sfbay.craigslist.org/sfc/pet/) in the SF area and return the href for any tag that matches the text "pup", ""puppy", "puppies" and "dog".  In addition you will need to use regex to make sure the puppy scraper should only return results from Aug 12.

![dog_picture](http://images.craigslist.org/00P0P_hrYfqZGsteP_600x450.jpg)

### Requirements
1. Use Nokogiri to scrape craigslist starting at [this](http://sfbay.craigslist.org/sfc/pet/) page
2. Use regex to match the text you search for ("pup", "puppy", "dog")
3. Test your methods and regular expressions with rspec

### Bonus 
1. Only return dog's who have an image in their description (hint: look for a span with the class of "p")
2. Make sure your result does not any links with the words "item" or "boots" 
3. Make sure your result does not include any rescue dogs





