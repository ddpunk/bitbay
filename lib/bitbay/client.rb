require 'faraday'
require 'base64'
require 'json'

module Bitbay
  class Client
    PUBLIC_HOST = 'https://bitbay.net/API/Public/'
    PRIVATE_HOST = 'https://bitbay.net/API/Trading/tradingApi.php'

    attr_reader :key, :secret

    def initialize(attrs = {})
      @key      = attrs[:key]
      @secret   = attrs[:secret]
    end

    def get_public(method, market = 'BTCPLN', params = {})
      response = connection.get do |req|
        req.url("#{PUBLIC_HOST}#{market}/#{method}.json")
        req.params.merge!(params)
      end

      JSON.parse(response.body)
    end

    def get(method, params = {})
      moment = Time.now.to_i
      response = connection.post do |req|
        req.url(PRIVATE_HOST)
        req.params.merge!(params)          

        if key
          req.params[:method]   = method
          req.params[:moment]   = moment
          req.headers['API-Key'] = key
          req.headers['API-Hash'] = signature(req.params.to_query, secret)
        end

      end

      JSON.parse(response.body)
    end

    private

    def signature(post, secret)
      OpenSSL::HMAC.hexdigest('sha512', secret, post)
    end

    def connection
      @connection ||= Faraday.new(:url => PRIVATE_HOST) do |faraday|
        faraday.request  :url_encoded
        faraday.adapter  Faraday.default_adapter
      end
    end
  end
end