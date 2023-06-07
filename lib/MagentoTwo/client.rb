require "MagentoTwo/configuration"

module MagentoTwo
  class Client
    attr_accessor :endpoint

    def initialize
      @endpoint = MagentoTwo.configuration.host
    end
  end
end
