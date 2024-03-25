require 'httparty'

url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"

response = HTTParty.get(url)
cryptos = JSON.parse(response.body)

sorted_cryptos = cryptos.sort_by { |crypto| -crypto["market_cap"] }.first(5)

puts "Top 5 Cryptocurrencies by Market Capitalization:"
sorted_cryptos.each do |crypto|
  puts "#{crypto["name"]}: Price: $#{crypto["current_price"]}, Market Cap: $#{crypto["market_cap"]}"
end
