module Bitbay
  module Public
    class Orderbook
      attr_reader :market, :bids, :asks

      def initialize(attrs = {})
        @market = attrs[:market]
        @bids = attrs[:bids]
        @asks = attrs[:asks]
      end

      def self.get(market = "BTCPLN", params = {})
        response = client.get_public('orderbook', market, params)
        return new({
          market: market,
          bids: response['bids'],
          asks: response['asks'],
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