require_relative 'config/initializers'
require_relative 'db/macleans_rss_feeds'
# get input from user
puts "Please provide the url from which you want to scrap items"
url = gets

begin
  scrap_items = Scrapper.scrap(url)

  # save scrap items to db
  rss_feed = MacleansRssFeed.new(url: url, data: scrap_items)

  if rss_feed.save
    puts scrap_items.to_json
  else
    puts 'Unable to extract data.'
  end
rescue
  puts 'Unable to scrap data. Please check your input'
end
