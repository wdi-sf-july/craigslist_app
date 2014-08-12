## Nokogiri, regex and rspec lab with Craigslist

Your task for tonight is to write a __Puppy Scraper__. Your scraper will search craigslist for all pets in the SF area and use regex to return the link (href) and text for any posting that matches the words "pup", ""puppy", "puppies" and "dog".  In addition, make sure the puppy scraper only returns results from August 12th

![dog_picture](http://images.craigslist.org/00P0P_hrYfqZGsteP_600x450.jpg)

### Requirements
1. Use Nokogiri to scrape craigslist using `today.html`
2. Use regex to match the text you search for ("pup", "puppy", "dog") and make sure you are only returning results from August 12th
3. Test your methods and regular expressions with rspec

### Bonus 
1. Only return dog's who have an image in their description (hint: look for a span with the class of "p")
2. Make sure your result does not any links with the words "house", item" or "boots" 
3. Make sure your result does not include any rescue dogs





