module MagentoTwo
  class Configuration
    class Error < StandardError; end

    attr_accessor :host, :token

    # Initialize every configuration with a default.
    # Users of the gem will override these with their
    # desired values
    def initialize
      @host = nil
      @token = nil
    end
  end
end
