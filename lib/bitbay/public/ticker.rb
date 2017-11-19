module Bitbay
  module Public
    class Ticker
      attr_reader :market, :max, :min, :last, :bid, :ask, :vwap, :average, :volume

      def initialize(attrs = {})
        @market = attrs[:market]
        @max = attrs[:max]
        @min = attrs[:min]
        @last = attrs[:last]
        @bid = attrs[:bid]
        @ask = attrs[:ask]
        @vwap = attrs[:vwap]
        @average = attrs[:average]
        @volume = attrs[:volume]
      end

      def self.get(market = "BTCPLN", params = {})
        response = client.get_public('ticker', market, params)
        puts response['max']
        return new({
          market: market,
          max: response['max'],
          min: response['min'],
          last: response['last'],
          bid: response['bid'],
          ask: response['ask'],
          vwap: response['vwap'],
          average: response['average'],
          volume: response['volume']
          }
        )
      end

      private

      def self.client
        @client ||= Bitbay.client
      end
    end
  end
end