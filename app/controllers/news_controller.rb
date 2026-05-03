class NewsController < ApplicationController
  NEWS_DATA = [
    { id: 1, slug: 'bitcoin-rompe-resistencia-65000-maximos-historicos', category: 'Bitcoin', time: 'Hace 1 hora', read_time: '6 min', author: 'Analista Cripto', title: "Bitcoin rompe resistencia clave de $65,000 — Analistas apuntan a nuevos máximos históricos", desc: "El precio del Bitcoin ha superado el nivel de resistencia de $65,000.", content: "El precio del Bitcoin ha superado el nivel de resistencia de $65,000.\n\nLos analistas de Bloomberg Intelligence han revisado al alza sus proyecciones para Bitcoin, estableciendo un nuevo objetivo de $80,000 para finales de año.", image: 'https://images.unsplash.com/photo-1518546305927-5a555bb7020d?w=1200&h=600&fit=crop&auto=format' },
    { id: 2, slug: 'blackrock-spot-bitcoin-etf-record-volumes', category: 'Institutional', time: 'Hace 2 horas', read_time: '4 min', author: 'Analista Cripto', title: "BlackRock's Spot Bitcoin ETF Hits Record Volumes Amid Institutional Push", desc: "Market analysts suggest that the recent surge in ETF inflows signifies a paradigm shift.", content: "Los flujos entrantes en los ETF de Bitcoin de BlackRock han alcanzado niveles históricos.\n\nLos datos muestran que los inversores institucionales están utilizando ETF de Bitcoin como herramienta de cobertura.", image: nil },
    { id: 3, slug: 'federal-reserve-interest-rate-crypto-volatility', category: 'Macro', time: 'Hace 5 horas', read_time: '5 min', author: 'Analista Cripto', title: 'Federal Reserve Interest Rate Forecasts Drive Volatility in Crypto Markets', desc: "As inflation data remains mixed, Bitcoin traders are hedging against potential rate adjustments.", content: "Los mercados de criptomonedas están experimentando volatilidad mientras los traders anticipan las próximas decisiones de tasas de interés.\n\nLos analysts sugieren que un posible recorte de tasas podría impulsar a Bitcoin hacia nuevos máximos.", image: nil }
  ]

  def index
    @news = NEWS_DATA
  end

  def show
    @news = NEWS_DATA
    # Buscar por slug primero, luego por id numérico (compatibilidad)
    param = params[:id]
    @article = @news.find { |n| n[:slug] == param }
    @article ||= @news.find { |n| n[:id] == param.to_i } if param =~ /^\d+$/
    
    if @article.nil?
      redirect_to news_index_path and return
    end
  end
end