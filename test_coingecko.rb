require_relative 'config/environment'

puts "Testing CoinGeckoClient with Demo API Key..."
puts "API KEY loaded: #{ENV['COINGECKO_API_KEY'].present? ? 'YES (Hidden)' : 'NO'}"

prices = ExternalApis::CoinGeckoClient.fetch_prices
puts "Prices fetched: #{prices.inspect}"

trending = ExternalApis::CoinGeckoClient.fetch_trending
puts "Trending fetched: #{trending.keys.inspect}"
