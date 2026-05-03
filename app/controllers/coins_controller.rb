class CoinsController < ApplicationController
  before_action :set_coin, only: [:show]

  def show
  end

  private

  def set_coin
    symbol_param = params[:id].to_s.upcase
    
    # Map symbol to coingecko id
    coingecko_ids = { 'BTC' => 'bitcoin', 'ETH' => 'ethereum', 'SOL' => 'solana', 'BNB' => 'binancecoin', 'XRP' => 'ripple', 'ADA' => 'cardano', 'DOT' => 'polkadot', 'LINK' => 'chainlink', 'MATIC' => 'matic-network', 'AVAX' => 'avalanche-2', 'DOGE' => 'dogecoin', 'LTC' => 'litecoin' }
    
    coingecko_id = coingecko_ids[symbol_param] || symbol_param.downcase
    
    # Fetch markets data for current_price, price_change, market_cap (more complete)
    markets_data = fetch_markets_data(coingecko_id)
    
    # Fetch detailed coin data for description, image
    detail_data = fetch_coin_detail(coingecko_id)
    
    if markets_data.present?
      @coin_data = {
        name: detail_data[:name] || names[symbol_param],
        symbol: symbol_param,
        current_price: markets_data[:current_price] || demo_price(symbol_param),
        price_change_24h: markets_data[:price_change_percentage_24h] || 0,
        image: markets_data[:image] || detail_data[:image],
        image_small: markets_data[:image_small] || detail_data[:image_small],
        image_thumb: markets_data[:image_thumb] || detail_data[:image_thumb],
        description: detail_data[:description].present? ? strip_tags(detail_data[:description]) : "#{symbol_param} is a cryptocurrency.",
        market_cap: markets_data[:market_cap],
        total_volume: markets_data[:total_volume],
        ath: markets_data[:ath],
        atl: markets_data[:atl],
        circulating_supply: markets_data[:circulating_supply],
        fully_diluted_valuation: markets_data[:fully_diluted_valuation]
      }
    else
      @coin_data = demo_data(symbol_param)
    end
  rescue => e
    Rails.logger.error("Error fetching coin data: #{e.message}")
    @coin_data = demo_data(params[:id].to_s.upcase)
  end
  
  def fetch_markets_data(coingecko_id)
    markets = ExternalApis::CoinGeckoClient.fetch_coins_markets(coingecko_id)
    return {} if markets.blank?
    
    coin = markets.first
    {
      current_price: coin['current_price'],
      price_change_percentage_24h: coin['price_change_percentage_24h'],
      market_cap: coin['market_cap'],
      total_volume: coin['total_volume'],
      ath: coin['ath'],
      atl: coin['atl'],
      circulating_supply: coin['circulating_supply'],
      fully_diluted_valuation: coin['fully_diluted_valuation'],
      image: coin['image'],
      image_small: coin['image'],
      image_thumb: coin['image']
    }
  rescue => e
    Rails.logger.error("Error fetching markets data: #{e.message}")
    {}
  end
  
  def fetch_coin_detail(coingecko_id)
    detail = ExternalApis::CoinGeckoClient.fetch_coin_data(coingecko_id)
    return {} if detail.blank?
    detail
  rescue => e
    Rails.logger.error("Error fetching coin detail: #{e.message}")
    {}
  end
  
  def names
    { 'BTC' => 'Bitcoin', 'ETH' => 'Ethereum', 'SOL' => 'Solana', 'BNB' => 'BNB', 'XRP' => 'XRP', 'ADA' => 'Cardano', 'DOT' => 'Polkadot', 'LINK' => 'Chainlink', 'MATIC' => 'Polygon', 'AVAX' => 'Avalanche', 'DOGE' => 'Dogecoin', 'LTC' => 'Litecoin' }
  end
  
  def demo_price(symbol)
    prices = { 'BTC' => '66,842.21', 'ETH' => '3,450.20', 'SOL' => '145.80', 'BNB' => '590.30', 'XRP' => '0.62', 'ADA' => '0.45', 'DOT' => '7.20', 'LINK' => '14.20', 'MATIC' => '0.87', 'AVAX' => '35.40' }
    prices[symbol] || '0.00'
  end
  
  def demo_data(symbol)
    {
      name: names[symbol] || symbol,
      symbol: symbol, 
      current_price: demo_price(symbol),
      price_change_24h: 0,
      description: "#{names[symbol] || symbol} is a cryptocurrency."
    }
  end
  
  def strip_tags(html)
    return '' if html.blank?
    ActionView::Base.full_sanitizer.sanitize(html)
  rescue
    html.to_s.gsub(/<[^>]+>/, '')[0..200]
  end
end