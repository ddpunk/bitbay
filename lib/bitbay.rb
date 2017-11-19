require "bitbay/version"

module Bitbay
  require 'bitbay/client'
  require 'bitbay/configuration'
  require 'bitbay/public/ticker'
  require 'bitbay/public/trades'

  def self.client
    @client ||= Client.new(configuration.auth)
  end

  def self.config
    yield configuration
    @client = Client.new(configuration.auth)
  end

  def self.configuration
    Configuration.instance
  end

  def self.root
    File.expand_path('../..', __FILE__)
  end
end
