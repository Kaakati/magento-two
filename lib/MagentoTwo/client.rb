require "MagentoTwo/configuration"
require "MagentoTwo/version"

module MagentoTwo
  class Client
    attr_accessor :endpoint

    def initialize
      @version = MagentoTwo::VERSION
      @endpoint = MagentoTwo.configuration.host
      @connection = Faraday.new(
        url: @endpoint,
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => "Bearer #{MagentoTwo.configuration.token}",
          'User-Agent' => "MagentoTwo/#{@version} (A Magento 2 API Wrapper on Ruby))"
        }
      )
    end
  end
end
