# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "== Seeding Crypto Categories and Subcategories =="

SUBCATEGORIES_CRYPTO = {
  # ============================================================
  #  BLOQUE BITCOIN 2025-2026
  # ============================================================

  'Bitcoin 2025-2026 — Precio y Mercado' => [
    'Precio BTC en Tiempo Real',
    'Máximos Históricos (ATH)',
    'Dominancia de Bitcoin',
    'Volumen de Mercado',
    'Correlación con Mercados Tradicionales',
    'BTC vs Oro y Reservas de Valor',
    'Flujos de Capital al Mercado',
    'Indicadores de Ciclo de Mercado'
  ],

  'Bitcoin 2025-2026 — Análisis y Predicciones' => [
    'Predicciones de Precio 2025',
    'Predicciones de Precio 2026',
    'Análisis Técnico BTC',
    'Análisis On-Chain BTC',
    'Modelos de Valoración (S2F, etc.)',
    'Sentimiento del Mercado',
    'Comparativa con Ciclos Anteriores',
    'Predicciones de Expertos e Instituciones'
  ],

  'Bitcoin 2025-2026 — Noticias y Actualidad' => [
    'Noticias de Última Hora BTC',
    'Movimientos de Ballenas',
    'Actualizaciones de Protocolo',
    'Noticias de Minería',
    'Declaraciones de Reguladores',
    'Adopción por Empresas',
    'Cobertura Mediática',
    'Análisis Post-Evento'
  ],

  'Bitcoin 2025-2026 — Adopción Institucional' => [
    'Compras Institucionales de BTC',
    'Empresas con BTC en Balance',
    'Fondos de Inversión en Bitcoin',
    'Bitcoin como Reserva de Valor Corporativa',
    'Banca y Bitcoin',
    'Gobiernos y Bitcoin',
    'MicroStrategy y Grandes Tenedores',
    'Ranking de Tenedores Institucionales'
  ],

  'Bitcoin 2025-2026 — Halving y Ciclos' => [
    'Halving de Abril 2024 — Efectos',
    'Ciclo Post-Halving 2024-2026',
    'Historia de los Halvings',
    'Impacto en Mineros',
    'Modelos de Precio Post-Halving',
    'Comparativa de Ciclos',
    'Próximo Halving — Proyecciones',
    'Emisión y Supply de BTC'
  ],

  'Bitcoin 2025-2026 — ETFs y Productos Financieros' => [
    'ETFs de Bitcoin Spot (USA)',
    'ETFs de Bitcoin en Europa y Asia',
    'Flujos de Capital en ETFs',
    'ETPs y Productos Estructurados',
    'Futuros CME y CBOE',
    'Opciones sobre Bitcoin',
    'Comparativa de ETFs por Comisión',
    'Impacto de los ETFs en el Precio'
  ],

  'Bitcoin 2025-2026 — Regulación Global' => [
    'Regulación USA (SEC, CFTC)',
    'Regulación Europa (MiCA)',
    'Regulación Asia-Pacífico',
    'Regulación Latinoamérica',
    'Bitcoin como Moneda Legal',
    'CBDC vs Bitcoin',
    'Prohibiciones y Restricciones',
    'Tendencias Regulatorias 2026'
  ],

  'Bitcoin 2025-2026 — Comunidad y Opinión' => [
    'Opinión de Bitcoin Maximalists',
    'Debates y Controversias',
    'Twitter/X Crypto Community',
    'Reddit Crypto Discussions',
    'Conferencias Bitcoin 2025-2026',
    'Encuestas y Sentimiento',
    'Críticas y Escepticismo',
    'Memes e Cultura Bitcoin'
  ],

  # ============================================================
  #  MERCADO Y PRECIOS
  # ============================================================

  'Precios en Tiempo Real' => [
    'Precios Top 10 Criptomonedas',
    'Precios Top 100',
    'Alertas de Precio',
    'Cambios 24h / 7d / 30d',
    'Comparador de Precios entre Exchanges',
    'Historial de Precios'
  ],

  'Capitalización de Mercado' => [
    'Market Cap Total del Mercado',
    'Dominancia BTC y ETH',
    'Top Criptomonedas por Market Cap',
    'Market Cap por Sectores',
    'Evolución Histórica del Market Cap'
  ],

  'Tendencias y Sentimiento' => [
    'Fear & Greed Index',
    'Trending Coins',
    'Volumen de Búsquedas',
    'Sentimiento en Redes Sociales',
    'Actividad On-Chain Global',
    'Narrativas Dominantes del Mercado'
  ],

  'Análisis Técnico' => [
    'Soportes y Resistencias Clave',
    'Patrones de Velas',
    'Indicadores Técnicos (RSI, MACD, BB)',
    'Análisis de Volumen',
    'Fibonacci y Ondas de Elliott',
    'Análisis Multi-Timeframe',
    'Señales de Trading'
  ],

  'Análisis On-Chain' => [
    'Flujos a Exchanges',
    'Movimiento de Ballenas',
    'MVRV y Métricas de Valoración',
    'Holders a Largo Plazo (LTH)',
    'Actividad de Red y Transacciones',
    'Hash Rate y Dificultad de Minería',
    'Supply en Profit/Loss'
  ],

  # ============================================================
  #  ACTIVOS Y PROYECTOS
  # ============================================================

  'Bitcoin (BTC)' => [
    'Fundamentos de Bitcoin',
    'Lightning Network',
    'Taproot y Actualizaciones',
    'Minería de Bitcoin',
    'Wallets de Bitcoin',
    'Historia de Bitcoin',
    'Satoshis y Unidades',
    'Casos de Uso de BTC'
  ],

  'Ethereum (ETH)' => [
    'Fundamentos de Ethereum',
    'Ethereum 2.0 y Staking',
    'Gas Fees y Optimización',
    'EIPs y Actualizaciones',
    'Ecosistema DeFi en ETH',
    'NFTs en Ethereum',
    'Layer 2 de Ethereum',
    'Burn de ETH y Deflación'
  ],

  'Altcoins y Tokens' => [
    'Solana (SOL)',
    'BNB y Binance Chain',
    'Cardano (ADA)',
    'Avalanche (AVAX)',
    'Polkadot (DOT)',
    'Chainlink (LINK)',
    'Tokens DeFi',
    'Nuevas Altcoins y Lanzamientos'
  ],

  'Stablecoins' => [
    'USDT (Tether)',
    'USDC (Circle)',
    'DAI y Stablecoins Descentralizadas',
    'Comparativa de Stablecoins',
    'Riesgos y Regulación de Stablecoins',
    'Yield con Stablecoins'
  ],

  'Memecoins' => [
    'Dogecoin (DOGE)',
    'Shiba Inu (SHIB)',
    'Nuevos Memecoins',
    'Análisis y Riesgos de Memecoins',
    'Cultura y Comunidad Memecoin',
    'Pump & Dump y Scams'
  ],

  'NFTs y Activos Digitales' => [
    'Mercado de NFTs',
    'Colecciones Destacadas',
    'NFTs en Gaming',
    'Arte Digital y NFTs',
    'Herramientas de NFTs',
    'Tendencias del Mercado NFT'
  ],

  # ============================================================
  #  TRADING E INVERSIÓN
  # ============================================================

  'Trading Spot' => [
    'Estrategias de Trading Spot',
    'Gestión de Riesgo',
    'Dollar Cost Averaging (DCA)',
    'Órdenes Limit y Market',
    'Trading de Corto Plazo',
    'Trading de Largo Plazo'
  ],

  'Trading de Futuros y Derivados' => [
    'Futuros Perpetuos',
    'Liquidaciones y Funding Rate',
    'Apalancamiento y Gestión',
    'Opciones Crypto',
    'Estrategias con Derivados',
    'Plataformas de Futuros'
  ],

  'DeFi y Yield Farming' => [
    'Protocolos DeFi Principales',
    'Liquidity Providing (LP)',
    'Yield Farming y APY',
    'Préstamos y Colateral DeFi',
    'Riesgos en DeFi (Impermanent Loss)',
    'Auditorías y Seguridad DeFi'
  ],

  'Portfolio y Gestión de Activos' => [
    'Diversificación de Portfolio Crypto',
    'Herramientas de Seguimiento',
    'Rebalanceo de Portfolio',
    'Gestión de Riesgo Global',
    'Portfolio Conservador vs Agresivo',
    'Rendimientos Históricos'
  ],

  'Estrategias de Inversión' => [
    'HODLing a Largo Plazo',
    'DCA y Acumulación',
    'Swing Trading',
    'Inversión en Proyectos Early-Stage',
    'Staking y Rendimiento Pasivo',
    'Estrategias en Mercado Bajista'
  ],

  # ============================================================
  #  EXCHANGES Y WALLETS
  # ============================================================

  'Exchanges Centralizados (CEX)' => [
    'Binance',
    'Coinbase',
    'Kraken',
    'Bybit',
    'OKX',
    'Comparativa de Exchanges',
    'Seguridad y Regulación de CEX',
    'Comisiones y Tarifas'
  ],

  'Exchanges Descentralizados (DEX)' => [
    'Uniswap',
    'PancakeSwap',
    'dYdX',
    'Comparativa de DEX',
    'Cómo Usar un DEX',
    'Liquidez y Slippage'
  ],

  'Wallets y Custodia' => [
    'Wallets de Hardware (Ledger, Trezor)',
    'Wallets de Software',
    'Wallets Móviles',
    'Custodia Propia vs Exchange',
    'Seed Phrases y Seguridad',
    'Multi-Sig y Custodia Avanzada'
  ],

  'Seguridad y Protección' => [
    'Cómo Evitar Scams y Phishing',
    'Mejores Prácticas de Seguridad',
    'Hacks y Exploits Recientes',
    'Autenticación en Dos Pasos (2FA)',
    'Seguros Crypto',
    'Recuperación de Fondos'
  ],

  # ============================================================
  #  TECNOLOGÍA BLOCKCHAIN
  # ============================================================

  'Redes Blockchain' => [
    'Comparativa de Blockchains',
    'Consenso PoW vs PoS',
    'Blockchains Públicas vs Privadas',
    'Velocidad y Escalabilidad',
    'Nodos y Descentralización',
    'Sidechains y Parachains'
  ],

  'Smart Contracts' => [
    'Introducción a Smart Contracts',
    'Solidity y Desarrollo',
    'Casos de Uso de Smart Contracts',
    'Auditorías y Vulnerabilidades',
    'Plataformas de Smart Contracts',
    'Automatización con Smart Contracts'
  ],

  'Layer 2 y Escalabilidad' => [
    'Optimistic Rollups (Optimism, Arbitrum)',
    'ZK Rollups',
    'Polygon y Soluciones L2',
    'Lightning Network (Bitcoin)',
    'Comparativa de Layer 2',
    'Adopción y Ecosistema L2'
  ],

  'Interoperabilidad y Bridges' => [
    'Bridges entre Blockchains',
    'Protocolos de Interoperabilidad',
    'Riesgos de los Bridges',
    'Atom y Cosmos',
    'Polkadot y Parachains',
    'Cross-Chain DeFi'
  ],

  'Web3 y Descentralización' => [
    'Introducción a Web3',
    'Identidad Descentralizada (DID)',
    'DAOs y Gobernanza',
    'Almacenamiento Descentralizado (IPFS)',
    'Metaverso y Web3',
    'Gaming Descentralizado'
  ],

  # ============================================================
  #  REGULACIÓN E INDUSTRIA
  # ============================================================

  'Regulación por País' => [
    'Regulación en USA',
    'Regulación en Europa (MiCA)',
    'Regulación en Asia',
    'Regulación en Latinoamérica',
    'Países Crypto-Friendly',
    'Prohibiciones y Restricciones',
    'Tendencias Regulatorias Globales'
  ],

  'Impuestos y Fiscalidad Crypto' => [
    'Impuestos Crypto en España',
    'Impuestos Crypto en Latinoamérica',
    'Declaración de Ganancias Crypto',
    'Herramientas de Fiscalidad Crypto',
    'Errores Fiscales Comunes',
    'Planificación Fiscal Crypto'
  ],

  'Instituciones y Empresas' => [
    'Empresas con Crypto en Balance',
    'Bancos y Crypto',
    'Fondos de Inversión Crypto',
    'Startups y Unicornios Crypto',
    'Venture Capital en Crypto',
    'Fusiones y Adquisiciones'
  ],

  'Minería y Validadores' => [
    'Minería de Bitcoin',
    'Hardware de Minería (ASICs)',
    'Pools de Minería',
    'Rentabilidad de la Minería',
    'Minería y Energía',
    'Staking como Validador',
    'Comparativa Minería vs Staking'
  ],

  # ============================================================
  #  COMUNIDAD Y EDUCACIÓN
  # ============================================================

  'Noticias y Actualidad' => [
    'Noticias del Mercado Crypto',
    'Noticias de Proyectos',
    'Noticias Regulatorias',
    'Hacks y Scams Recientes',
    'Lanzamientos y Listings',
    'Noticias de Última Hora'
  ],

  'Educación Crypto' => [
    'Introducción a las Criptomonedas',
    'Cómo Comprar tu Primera Crypto',
    'Blockchain para Principiantes',
    'Glosario Crypto',
    'Cursos y Recursos',
    'Errores Comunes de Principiantes'
  ],

  'Comunidad y Foros' => [
    'Foro General Crypto',
    'Comunidades por Proyecto',
    'Debates y Controversias',
    'Encuestas y Opiniones',
    'AMAs y Entrevistas',
    'Grupos Regionales'
  ],

  'Influencers y Opinión' => [
    'Opiniones de Analistas Top',
    'Twitter/X Crypto',
    'YouTube Crypto',
    'Debates entre Expertos',
    'Críticas al Sector Crypto',
    'Predicciones Famosas'
  ],

  'Podcast y Medios' => [
    'Podcasts de Crypto en Español',
    'Podcasts Internacionales',
    'Medios Especializados',
    'Newsletters Crypto',
    'Canales de YouTube Recomendados'
  ],

  'Eventos y Conferencias' => [
    'Bitcoin Conference 2025-2026',
    'Consensus',
    'ETHDenver y Eventos Ethereum',
    'Eventos en Latinoamérica',
    'Hackathons y Competencias',
    'Calendario de Eventos Crypto'
  ],

  'Otros' => [
    'Temas Misceláneos'
  ]
}

SUBCATEGORIES_CRYPTO.each do |category_name, subcategories|
  category = Category.find_or_create_by!(name: category_name)
  subcategories.each do |subcategory_name|
    Subcategory.find_or_create_by!(name: subcategory_name, category: category)
  end
end

puts "== Seeded #{Category.count} Categories and #{Subcategory.count} Subcategories =="

puts "== Seeding Initial Crypto Assets Universe =="

# Top 20 y monedas populares (basado en CoinGecko IDs)
INITIAL_ASSETS = [
  { name: 'Bitcoin', symbol: 'BTC', coingecko_id: 'bitcoin' },
  { name: 'Ethereum', symbol: 'ETH', coingecko_id: 'ethereum' },
  { name: 'Tether', symbol: 'USDT', coingecko_id: 'tether' },
  { name: 'BNB', symbol: 'BNB', coingecko_id: 'binancecoin' },
  { name: 'Solana', symbol: 'SOL', coingecko_id: 'solana' },
  { name: 'USDC', symbol: 'USDC', coingecko_id: 'usd-coin' },
  { name: 'XRP', symbol: 'XRP', coingecko_id: 'ripple' },
  { name: 'Dogecoin', symbol: 'DOGE', coingecko_id: 'dogecoin' },
  { name: 'Toncoin', symbol: 'TON', coingecko_id: 'the-open-network' },
  { name: 'Cardano', symbol: 'ADA', coingecko_id: 'cardano' },
  { name: 'Shiba Inu', symbol: 'SHIB', coingecko_id: 'shiba-inu' },
  { name: 'Avalanche', symbol: 'AVAX', coingecko_id: 'avalanche-2' },
  { name: 'Polkadot', symbol: 'DOT', coingecko_id: 'polkadot' },
  { name: 'Chainlink', symbol: 'LINK', coingecko_id: 'chainlink' },
  { name: 'Polygon', symbol: 'MATIC', coingecko_id: 'matic-network' },
  { name: 'Pepe', symbol: 'PEPE', coingecko_id: 'pepe' },
  { name: 'Near Protocol', symbol: 'NEAR', coingecko_id: 'near' },
  { name: 'Litecoin', symbol: 'LTC', coingecko_id: 'litecoin' },
  { name: 'Arbitrum', symbol: 'ARB', coingecko_id: 'arbitrum' },
  { name: 'Aptos', symbol: 'APT', coingecko_id: 'aptos' }
]

INITIAL_ASSETS.each do |asset_attrs|
  CryptoAsset.find_or_create_by!(coingecko_id: asset_attrs[:coingecko_id]) do |asset|
    asset.name = asset_attrs[:name]
    asset.symbol = asset_attrs[:symbol]
  end
end

puts "== Seeded #{CryptoAsset.count} Crypto Assets =="
