module Bitbay
  module Public
    class Trades
      attr_reader :market, :since, :order, :trades

      def initialize(attrs = {})
        @market = attrs[:market]
        @since = attrs[:since]
        @order = attrs[:order]
        @trades = attrs[:trades]
      end

      def self.get(market = "BTCPLN", since = 0, order = 'desc')
        new({
          market: market,
          since: since,
          order: order,
          trades: client.get_public('trades', market, since: since, order: order) 
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