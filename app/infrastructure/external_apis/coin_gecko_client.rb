require 'net/http'
require 'json'

module ExternalApis
    class CoinGeckoClient
      BASE_URL = 'https://api.coingecko.com/api/v3'

      def self.headers
        api_key = ENV.fetch('COINGECKO_API_KEY', '')
        {
          'accept' => 'application/json',
          'x-cg-demo-api-key' => api_key
        }
      end

      def self.fetch_prices(ids = 'bitcoin,ethereum,solana')
        url = URI("#{BASE_URL}/simple/price?ids=#{ids}&vs_currencies=usd&include_market_cap=true&include_24hr_vol=true&include_24hr_change=true")
        request = Net::HTTP::Get.new(url, headers)
        
        response = Net::HTTP.start(url.hostname, url.port, use_ssl: true) do |http|
          http.request(request)
        end
        
        JSON.parse(response.body)
      rescue StandardError => e
        Rails.logger.error("Error fetching prices from CoinGecko: #{e.message}")
        {}
      end

      # Fetch coins market data including images
      def self.fetch_coins_markets(ids = 'bitcoin,ethereum,solana,binancecoin,ripple,cardano,avalanche-2,polkadot,matic-network,chainlink')
        url = URI("#{BASE_URL}/coins/markets?vs_currency=usd&ids=#{ids}&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h")
        request = Net::HTTP::Get.new(url, headers)
        
        response = Net::HTTP.start(url.hostname, url.port, use_ssl: true) do |http|
          http.request(request)
        end
        
        JSON.parse(response.body)
      rescue StandardError => e
        Rails.logger.error("Error fetching coins markets from CoinGecko: #{e.message}")
        []
      end

      def self.fetch_coin_data(id)
        url = URI("#{BASE_URL}/coins/#{id}?localization=false&tickers=false&community_data=false&developer_data=false&sparkline=false")
        request = Net::HTTP::Get.new(url, headers)
        
        response = Net::HTTP.start(url.hostname, url.port, use_ssl: true) do |http|
          http.request(request)
        end
        
        data = JSON.parse(response.body)
        {
          name: data.dig('name'),
          symbol: data.dig('symbol', 'upcase'),
          image: data.dig('image', 'large'),
          image_small: data.dig('image', 'small'),
          image_thumb: data.dig('image', 'thumb'),
          description: data.dig('description', 'en'),
          market_data: data.dig('market_data', 'current_price', 'usd'),
          market_cap: data.dig('market_data', 'market_cap', 'usd'),
          total_volume: data.dig('market_data', 'total_volume', 'usd'),
          price_change_24h: data.dig('market_data', 'price_change_percentage_24h'),
          ath: data.dig('market_data', 'ath', 'usd'),
          atl: data.dig('market_data', 'atl', 'usd'),
          circulating_supply: data.dig('market_data', 'circulating_supply')
        }
      rescue StandardError => e
        Rails.logger.error("Error fetching coin data from CoinGecko: #{e.message}")
        {}
      end

      def self.fetch_trending
        url = URI("#{BASE_URL}/search/trending")
        request = Net::HTTP::Get.new(url, headers)
        
        response = Net::HTTP.start(url.hostname, url.port, use_ssl: true) do |http|
          http.request(request)
        end
        
        JSON.parse(response.body)
      rescue StandardError => e
        Rails.logger.error("Error fetching trending from CoinGecko: #{e.message}")
        {}
      end
  end
end